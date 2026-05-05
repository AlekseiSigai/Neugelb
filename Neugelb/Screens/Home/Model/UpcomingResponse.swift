//
//  UpcomingResponse.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Foundation

struct UpcomingResponse: Codable {
    let dates: Dates
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

extension UpcomingResponse {
    struct Dates: Codable {
        let maximum: String
        let minimum: String
    }

    struct Movie: Codable, Identifiable {
        let adult: Bool
        let backdropPath: String
        let genreIds: [Int]
        let id: Int
        let originalLanguage: String
        let originalTitle: String
        let overview: String
        let popularity: Double
        let posterPath: String
        let releaseDate: String
        let title: String
        let video: Bool
        let voteAverage: Double
        let voteCount: Int

        enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case genreIds = "genre_ids"
            case id
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview
            case popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title
            case video
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }
}

extension UpcomingResponse.Movie {
    
    enum PosterSize: String {
        case w92
        case w154
        case w185
        case w342
        case w500
        case w780
    }
    
    func posterURL(size: PosterSize) -> URL? {
        let baseURL = "https://image.tmdb.org/t/p/"
        return URL(string: baseURL + size.rawValue + posterPath)
    }
}
