//
//  TokenUpdateViewModel.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Combine
import Foundation
import os.log

@MainActor
protocol TokenUpdateViewModelProtocol: ObservableObject {
    func updateToken(_ token: String)
}

@Observable
final class TokenUpdateViewModel: TokenUpdateViewModelProtocol {
    
    // MARK: Private properties
    
    private let keychainManager: KeychainManaging
    private let router: TokenUpdateRouting
    private let logger = Logger(subsystem: AppConfig.subsystem, category: "TokenUpdateViewModel")
    
    // MARK: Initializer

    init(keychainManager: KeychainManaging,
         router: TokenUpdateRouting
    ) {
        self.keychainManager = keychainManager
        self.router = router
    }
    
    // MARK: Functions
    
    func updateToken(_ token: String) {
        Task {
            do {
                try await keychainManager.upsertString(token, forKey: AppConfig.KeychainKeys.token.rawValue)
                router.routeToRoot()
            } catch  {
                logger.error("\(error.localizedDescription)")
            }
        }
    }
}
