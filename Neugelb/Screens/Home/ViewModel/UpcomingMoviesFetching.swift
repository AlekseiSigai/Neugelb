//
//  UpcomingMoviesFetching.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import NetworkService

/// NetworkService to get list of movies that are being released soon
protocol UpcomingMoviesFetching {
    func fetchUpcomingMovies(page: Int, apiToken: String) async throws -> UpcomingResponse
}

extension NetworkService: UpcomingMoviesFetching {
    func fetchUpcomingMovies(page: Int, apiToken: String) async throws -> UpcomingResponse {
        let request = UpcomingRequest(page: page, apiToken: apiToken)
        
        return try await NetworkService.shared.fetchData(on: request)
    }
}
