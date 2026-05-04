//
//  KeychainManager+Stub.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Foundation

extension KeychainManager {
    struct Stub {
        struct Manager: KeychainManaging {
            func get(forKey key: String) throws -> Data? { nil }
            func removeValue(forKey key: String) throws { }
            func set(_ data: Data, forKey key: String) throws { }
            func update(_ data: Data, forKey key: String) throws { }
            func upsert(_ data: Data, forKey key: String) throws { }
            func valueExists(forKey key: String) -> Bool { false }

            func getString(forKey key: String) throws -> String? { nil }
            func setString(_ string: String, forKey key: String) throws { }
            func updateString(_ string: String, forKey key: String) throws { }
            func upsertString(_ string: String, forKey key: String) throws { }
        }
    }
}
