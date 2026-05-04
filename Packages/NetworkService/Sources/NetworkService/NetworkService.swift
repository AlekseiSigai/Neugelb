//
//  NetworkService.swift
//  NetworkService
//
//  Created by Aleksei Sigai on 02.05.26.
//

import Foundation

/// Service for receiving a data from the network
///
/// Use an extension to add a function to receive a response for a new feature

@MainActor
public protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(on request: NetworkRequest) async throws -> T
}

public final class NetworkService: NetworkServiceProtocol {
    
    // MARK: Properties
    
    public static let shared = NetworkService()
    
    // MARK: Private properties
    
    private let requestFactory = RequestFactory()
    
    // MARK: Initialization
    
    private init() {}
    
    // MARK: Functions

    /// Generic function for receiving a data from the network
    public func fetchData<T: Decodable>(on request: NetworkRequest) async throws -> T {
        guard let request = requestFactory.create(request) else {
            throw NetworkError.invalidRequest
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.serverError
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error as DecodingError {
            throw NetworkError.serverError
        }
    }
}
