//
//  HomeRouting.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Router

@MainActor
protocol HomeRouting {
    func routeToDetails(movie: UpcomingResponse.Movie)
}

extension Router: HomeRouting {
    func routeToDetails(movie: UpcomingResponse.Movie) {
        route(to: Screen(id: ScreenID.details.rawValue,
                         content: DetailsFactory.create(movie: movie)))
    }
}
