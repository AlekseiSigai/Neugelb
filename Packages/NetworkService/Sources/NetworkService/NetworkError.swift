//
//  NetworkError.swift
//  NetworkService
//
//  Created by Aleksei Sigai on 02.05.26.
//

import Foundation

/// Identifier of the cause of the error that occurred for further processing

public enum NetworkError: Error {
    case invalidURL
    case invalidRequest
    case networkConnection
    case serverError
    case timeOut
    case unknow
    case unsupportedImage
}

public extension NetworkError {
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidRequest:
            return "Invalid request"
        case .networkConnection:
            return "No internet connection"
        case .serverError:
            return "Server error, please try again later"
        case .timeOut:
            return "Service is temporarily unavailable. Please try again later"
        case .unknow:
            return "An unknown error has occurred. Please try again later"
        case .unsupportedImage:
            return "Unsupported image was fetched"
        }
    }
}
