//
//  DetailsViewModel+Stub.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 05.05.26.
//

extension DetailsViewModel {
    @MainActor
    struct Stub {
        static let viewModel = DetailsViewModel(movie: UpcomingResponse.Movie.Stub.movie1,
                                                router: DetailsRoutingStub())
    }
}
