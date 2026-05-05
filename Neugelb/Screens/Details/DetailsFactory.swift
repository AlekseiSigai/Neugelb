//
//  DetailsFactory.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 05.05.26.
//

import SwiftUI
import Router

final class DetailsFactory {
    @MainActor
    static public func create(movie: UpcomingResponse.Movie) -> some View {
        let viewModel = DetailsViewModel(movie: movie,
                                         router: Router.shared)

        return DetailsScreen(viewModel: viewModel)
    }
}
