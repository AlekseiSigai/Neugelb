//
//  TokenUpdateRouting.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Router

@MainActor
protocol TokenUpdateRouting {
    func routeToRoot()
}

extension Router: TokenUpdateRouting {
    func routeToRoot() {
        routeToRoot(inTab: .tab1)
    }
}
