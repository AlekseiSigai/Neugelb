//
//  DetailsRouting.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 05.05.26.
//

import Router

@MainActor
protocol DetailsRouting {
    func routeBack()
}

extension Router: DetailsRouting { }
