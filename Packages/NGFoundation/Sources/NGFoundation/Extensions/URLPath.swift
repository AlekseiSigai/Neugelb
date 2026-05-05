//
//  URLPath.swift
//  NGFoundation
//
//  Created by Aleksei Sigai on 03.05.26.
//

import Foundation

/// A string whose components can be added as URL path components.
///
public typealias URLPath = String

extension URLPath {

    private var pathComponents: [URLPath] {
        self.components(separatedBy: "/").filter { !$0.isEmpty }
    }

    public func appendingPathComponent(_ component: URLPath) -> URLPath {
        self + "/" + component
    }

    public mutating func appendingPathComponent(_ component: URLPath) {
        self = self + "/" + component
    }

    public func removePathComponents(_ side: Self.Side, count: Int) -> URLPath {
        var pathComponents = pathComponents
        guard pathComponents.count > count else { return self }

        switch side {
        case .first:
            pathComponents = Array(pathComponents.dropFirst(count))
        case .last:
            pathComponents = Array(pathComponents.dropLast(count))
        }
        guard let firstPathComponent = pathComponents.first else { return self }

        var result = firstPathComponent
        if pathComponents.count == 1 {
            return result
        } else {
            pathComponents.removeFirst()
            pathComponents.forEach { pathComponent in
                result = result.appendingPathComponent(pathComponent)
            }

            return result
        }
    }
    
    public func updatePathComponent(_ component: Self, to newComponent: Self) -> URLPath {
        guard let _ = self.range(of: component) else { return self }

        let pathComponents = self.split(separator: "/")
        guard let index = pathComponents.firstIndex(of: Substring(component)) else { return self }
        
        var updatedComponents = pathComponents
        updatedComponents[index] = Substring(newComponent)
        return updatedComponents.joined(separator: "/")
    }
}

public extension URLPath {
    enum Side {
        case first
        case last
    }
}
