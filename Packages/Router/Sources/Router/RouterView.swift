//
//  RouterView.swift
//  Router
//
//  Created by Aleksei Sigai on 04.05.26.
//

import SwiftUI

struct RouterView<Content: View>: View {

    // MARK: Private properties

    @StateObject private var router = Router.shared
    private let tab: Router.Tab
    private let content: Content

    // MARK: Initializer

    init(_ content: Content,
         tab: Router.Tab
    ) {
        self.content = content
        self.tab = tab
    }

    // MARK: Body

    var body: some View {
        NavigationStack(path: navigationPath(of: tab)) {
            content
                .navigationDestination(for: Screen.self) { screen in
                    screen.content
                }
        }
    }
    
    private func navigationPath(of tab: Router.Tab) -> Binding<[Screen]> {
        switch tab {
        case .tab0:
            return $router.navigationPath0
        case .tab1:
            return $router.navigationPath1
        }
    }
}
