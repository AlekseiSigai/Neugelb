//
//  HomeViewModel.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Combine
import Foundation
import NGFoundation
import os.log

@MainActor
protocol HomeViewModelProtocol: ObservableObject, MovieCellViewModelProtocol {
    var movies: [UpcomingResponse.Movie] { get }
    func loadFirstMovies()
    func fetchMoreMoviesIfNeeded(afterID displayMovieID: Int)
    func routeToDetails(movie: UpcomingResponse.Movie)
}

protocol MovieCellViewModelProtocol {
    func normalizedDate(_ date: String) -> String?
}

@Observable
final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: Properties
    
    var movies: [UpcomingResponse.Movie] = []
    
    // MARK: Private properties
    
    private let networkService: UpcomingMoviesFetching
    private let keychainManager: KeychainManaging
    private let router: HomeRouting
    
    private let logger = Logger(subsystem: AppConfig.subsystem, category: "HomeViewModel")
    private var apiToken: String?
    private var currentPage: Int = 0
    private var totalPages: Int = 1
    
    // MARK: Initializer
    
    init(networkService: UpcomingMoviesFetching,
         keychainManager: KeychainManaging,
         router: HomeRouting
    ) {
        self.networkService = networkService
        self.keychainManager = keychainManager
        self.router = router
    }
    
    // MARK: Functions
    
    func loadFirstMovies() {
        guard currentPage == 0 else { return }

        Task {
            if apiToken == nil {
                self.apiToken = try await keychainManager.getString(forKey: AppConfig.KeychainKeys.token.rawValue)
            }
            guard let apiToken else {
                return
            }
            
            do {
                let response = try await networkService.fetchUpcomingMovies(page: 1, apiToken: apiToken)
                currentPage = 1
                totalPages = response.totalPages
                
                movies = response.results
            } catch {
                logger.error("\(error.localizedDescription)")
            }
        }
    }
    
    func fetchMoreMoviesIfNeeded(afterID displayMovieID: Int) {
        guard currentPage < totalPages,
              let apiToken else { return }
        
        let index = movies.index(before: movies.count - 5)
        guard displayMovieID == movies[index].id else { return }
        
        Task {
            let nextPage = currentPage + 1
            let response = try await networkService.fetchUpcomingMovies(page: nextPage, apiToken: apiToken)
            currentPage = nextPage
            
            movies.append(contentsOf: response.results)
        }
    }
    
    func routeToDetails(movie: UpcomingResponse.Movie) {
        router.routeToDetails(movie: movie)
    }
}

extension HomeViewModel: MovieCellViewModelProtocol {
    func normalizedDate(_ date: String) -> String? {
        guard let date = CustomDateFormatter.themoviedb.date(from: date) else { return nil }
        
        return CustomDateFormatter.longGB.string(from: date)
    }
}
