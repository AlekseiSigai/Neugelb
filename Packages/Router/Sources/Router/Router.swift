//
//  Router.swift
//  Router
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Foundation
import SwiftUI
import OSLog

@MainActor
public protocol Routing: ObservableObject {
    var selectedTab: Router.Tab { get set }
    func rootView<Content: View>(_ view: Content, for tab: Router.Tab) -> AnyView
    func route(to screen: Screen, inTab tab: Router.Tab?, animated: Bool)
    func routeToRoot(inTab tab: Router.Tab?)
    func routeBack(animated: Bool)
    func routeBack(to screenID: String)
}
@MainActor
public extension Routing {
    func route(to screen: Screen) {
        route(to: screen, inTab: nil, animated: true)
    }
    
    func routeToRoot() {
        routeToRoot(inTab: nil)
    }

    func routeBack() {
        routeBack(animated: true)
    }
}

public final class Router: Routing {
     
    // MARK: Properties
    
    public static let shared = Router()
    
    @Published public var selectedTab: Tab = .tab0
    
    @Published var navigationPath0: [Screen] = [] {
        willSet {
            
        }
        didSet {
            navigationPathWasUpdated(tab: .tab0,
                                     count: navigationPath0.count,
                                     oldCount: oldValue.count)
        }
    }
    @Published var navigationPath1: [Screen] = [] {
        didSet {
            navigationPathWasUpdated(tab: .tab1,
                                     count: navigationPath1.count,
                                     oldCount: oldValue.count)
        }
    }
    
    // MARK: Private properties
    
    private let logger = Logger(subsystem: "Routing", category: "")
    
    // MARK: Initializer
    
    private init() { }
    
    // MARK: Functions
    
    public func rootView<Content: View>(_ view: Content, for tab: Tab) -> AnyView {
        return AnyView(RouterView(view, tab: tab))
    }
    
    public func route(to screen: Screen, inTab tab: Router.Tab?, animated: Bool) {
        let tab = tab ?? selectedTab
        var transaction = Transaction()
        transaction.disablesAnimations = !animated
        logger.log("Router tab \(tab.rawValue): routing to \(screen.id)")
        
        switch screen.presentation {
        case .regular:
            withTransaction(transaction) {
                navigationPath(for: tab) { navigationPath in
                    navigationPath.append(screen)
                }
            }
        }
    }
      
    public func routeToRoot(inTab tab: Router.Tab?) {
        let tab = tab ?? selectedTab
        logger.log("Router tab \(tab.rawValue): routing to root")
        
        navigationPath(for: tab) { navigationPath in
            navigationPath.removeAll()
        }
    }
    
    public func routeBack(animated: Bool) {
        var transaction = Transaction()
        transaction.disablesAnimations = !animated
        
        navigationPath(for: selectedTab) { navigationPath in
            guard !navigationPath.isEmpty else { return }

            logger.log("Routing back")
            withTransaction(transaction) {
                navigationPath.removeLast()
                return
            }
        }
    }

    public func routeBack(to screenID: String) {
        navigationPath(for: selectedTab) { navigationPath in
            guard let index = navigationPath.firstIndex(where: { $0.id == screenID }) else { return }

            logger.log("Routing back to: \(screenID)")
            navigationPath.removeLast(navigationPath.count - index - 1)
        }
    }
    
    // MARK: Private functions
    
    private func navigationPathWasUpdated(tab: Tab,
                                          count: Int,
                                          oldCount: Int) {
        if count < oldCount {
            logger.log("Router tab \(tab.rawValue): Routing back")
        }
        logger.log("Router tab \(tab.rawValue): navigationPath.count \(count)")
    }
    
    private func navigationPath(for tab: Tab, navigationPath: (inout [Screen]) -> Void) {
        switch tab {
        case .tab0:
            navigationPath(&navigationPath0)
        case .tab1:
            navigationPath(&navigationPath1)
        }
    }
}
