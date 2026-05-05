//
//  HomeViewModel+Stub.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

extension HomeViewModel {
    @MainActor
    struct Stub {
        static let viewModel = HomeViewModel(networkService: UpcomingMoviesFetchingStub(),
                                             keychainManager: KeychainManager.Stub.Manager(),
                                             router: HomeRoutingStub())
    }
}
