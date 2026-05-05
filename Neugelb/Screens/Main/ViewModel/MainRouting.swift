//
//  MainRouting.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Router
import SwiftUI

@MainActor
protocol MainRouting {
    var selectedTab: Router.Tab { get set }
    func rootView<Content: View>(_ view: Content, for tabIndex: Router.Tab) -> AnyView
    func routeToTab(_ tab: TabName)
}

extension Router: MainRouting {
    func routeToTab(_ tab: TabName) {
        
    }
}
