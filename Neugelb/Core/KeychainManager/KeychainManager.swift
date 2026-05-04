//
//  KeychainManager.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Foundation
import NGFoundation

/// Manager to use Keychain
///
protocol KeychainManaging {
    /// Get data
    func get(forKey key: String) async throws -> Data?
    /// Remove value
    func removeValue(forKey key: String) async throws
    /// Set data
    func set(_ data: Data, forKey key: String) async throws
    /// Update data
    func update(_ data: Data, forKey key: String) async throws
    /// Set data or update if the data already exists
    func upsert(_ data: Data, forKey key: String) async throws
    /// Check if value exists
    func valueExists(forKey key: String) async -> Bool
    
    /// Get string
    func getString(forKey key: String) async throws -> String?
    /// Set string
    func setString(_ string: String, forKey key: String) async throws
    /// Update string
    func updateString(_ string: String, forKey key: String) async throws
    /// Set string or update if the string already exists
    func upsertString(_ string: String, forKey key: String) async throws
}

actor KeychainManager: KeychainManaging {

    // MARK: Private properties

    private let service: String = Bundle.main.bundleIdentifier ?? .empty

    // MARK: Functions
    
    func get(forKey key: String) throws -> Data? {
        var query = baseQuery(forKey: key)
        query[kSecReturnData as String] = kCFBooleanTrue
        query[kSecMatchLimit as String] = kSecMatchLimitOne

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        switch status {
        case errSecSuccess:
            return result as? Data
        case errSecItemNotFound:
            return nil
        default:
            throw KeychainError.unexpectedStatus(status)
        }
    }
    
    func removeValue(forKey key: String) throws {
        let status = SecItemDelete(baseQuery(forKey: key) as CFDictionary)

        if status != errSecSuccess && status != errSecItemNotFound {
            throw KeychainError.unexpectedStatus(status)
        }
    }

    func set(_ data: Data, forKey key: String) throws {
        var query = baseQuery(forKey: key)
        query[kSecValueData as String] = data

        let status = SecItemAdd(query as CFDictionary, nil)

        switch status {
        case errSecSuccess:
            return
        case errSecDuplicateItem:
            throw KeychainError.duplicateItem
        default:
            throw KeychainError.unexpectedStatus(status)
        }
    }

    func update(_ data: Data, forKey key: String) throws {
        let query = baseQuery(forKey: key)
        let attributes = [kSecValueData as String: data]

        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)

        switch status {
        case errSecSuccess:
            return
        case errSecItemNotFound:
            throw KeychainError.itemNotFound
        default:
            throw KeychainError.unexpectedStatus(status)
        }
    }

    func upsert(_ data: Data, forKey key: String) throws {
        if valueExists(forKey: key) {
            try update(data, forKey: key)
        } else {
            try set(data, forKey: key)
        }
    }

    func valueExists(forKey key: String) -> Bool {
        var query = baseQuery(forKey: key)
        query[kSecMatchLimit as String] = kSecMatchLimitOne

        let status = SecItemCopyMatching(query as CFDictionary, nil)
        return status == errSecSuccess
    }

    // MARK: Private functions

    private func baseQuery(forKey key: String) -> [String: Any] {
        [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key
        ]
    }
}

extension KeychainManaging {
    func getString(forKey key: String) async throws -> String? {
        guard let data = try await get(forKey: key) else {
            return nil
        }

        guard let string = String(data: data, encoding: .utf8) else {
            throw KeychainError.decodingFailed
        }

        return string
    }
    
    func setString(_ string: String, forKey key: String) async throws {
        guard let data = string.data(using: .utf8) else {
            throw KeychainError.encodingFailed
        }
        try await set(data, forKey: key)
    }

    func updateString(_ string: String, forKey key: String) async throws {
        guard let data = string.data(using: .utf8) else {
            throw KeychainError.encodingFailed
        }
        try await update(data, forKey: key)
    }

    func upsertString(_ string: String, forKey key: String) async throws {
        if await valueExists(forKey: key) {
            try await updateString(string, forKey: key)
        } else {
            try await setString(string, forKey: key)
        }
    }
}
