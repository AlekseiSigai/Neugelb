//
//  NetworkRequest.swift
//  NetworkService
//
//  Created by Aleksei Sigai on 02.05.26.
//

import Foundation
import NGFoundation

/// Protocol for creating a new request
///
/// Required parameters:
///  - host;
///  - path.
///
public protocol NetworkRequest {
    var apiVersion: String? { get }
    
    var method: HTTPMethod? { get }
    var scheme: URLScheme? { get }
    var host: String { get }
    var path: String { get }
    var additionalPath: String? { get }
    var headers: [String: String]? { get }
    var parameters: URLParameters? { get }
}

public extension NetworkRequest {
    var apiVersion: String? { nil }
    var method: HTTPMethod? { nil }
    var scheme: URLScheme? { nil }
    var additionalPath: String? { nil }
    var headers: [String: String]? { nil }
    var parameters: URLParameters? { nil }
}

public typealias URLParameters = [String: Any]

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case head = "HEAD"
    case delete = "DELETE"
    case patch = "PATCH"
}

public enum URLScheme: String {
    case http = "http"
    case https = "https"
}
