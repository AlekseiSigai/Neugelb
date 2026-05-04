//
//  MainRouting+Stub.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Router
import SwiftUI

struct MainRoutingStub: MainRouting {
    var selectedTab: Router.Tab = .tab0
    func rootView<Content: View>(_ view: Content, for tab: Router.Tab) -> AnyView {
        return AnyView(EmptyView())
    }
    func routeToTab(_ tab: TabName) { }
}
