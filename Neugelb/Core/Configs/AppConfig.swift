//
//  AppConfig.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 03.05.26.
//

import Foundation
import NGFoundation

struct AppConfig {
    static let baseURL: String = {
        guard let value = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            fatalError("BaseURL not found in Info.plist")
        }
        return value
    }()
    
    static let apiVersion = 3
    static let apiToken = String.empty
    
    enum KeychainKeys: String {
        case token
    }
}
