//
//  SettingsRouting.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Router

@MainActor
protocol SettingsRouting {
    func routeToTokenUpdate()
}

extension Router: SettingsRouting {
    func routeToTokenUpdate() {
        route(to: Screen(id: ScreenID.tokenUpdate.rawValue,
                         content: TokenUpdateFactory.create()))
    }
}
