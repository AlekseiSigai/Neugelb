//
//  RequestFactory.swift
//  NetworkService
//
//  Created by Aleksei Sigai on 02.05.26.
//

import Foundation

/// The factory provides creating an URLRequest

struct RequestFactory {
    
    // MARK: Functions
    
    /// Creating an URLRequest from the NetworkRequest
    func create(_ request: NetworkRequest) -> URLRequest? {
        guard let url = url(for: request) else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method?.rawValue ?? HTTPMethod.get.rawValue

        if let headers = request.headers {
            for header in headers {
                urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        return urlRequest
    }
    
    // MARK: Private functions
    
    private func url(for request: NetworkRequest) -> URL? {
        var components = URLComponents()
        components.scheme = request.scheme?.rawValue ?? URLScheme.https.rawValue
        components.host = request.host
        components.path = normalizedPath(request.path)
        
        components.queryItems = []
        if let parameters = request.parameters {
            for parameter in parameters {
                guard let value = stringValue(from: parameter.value) else {
                    continue
                }
                
                components.queryItems?.append(
                    URLQueryItem(name: parameter.key, value: value)
                )
            }
        }
        
        return components.url
    }
    
    private func normalizedPath(_ path: String) -> String {
        if !path.hasPrefix("/"), !path.isEmpty {
            return "/" + path
        }
        
        return path
    }
    
    private func stringValue(from value: Any) -> String? {
        if let stringValue = value as? String {
            return stringValue
        }
        
        if let intValue = value as? Int {
            return String(intValue)
        }
        
        if let doubleValue = value as? Double {
            return String(doubleValue)
        }
        
        return nil
    }
}
