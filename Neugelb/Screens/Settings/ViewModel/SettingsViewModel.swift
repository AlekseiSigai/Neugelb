//
//  SettingsViewModel.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Combine
import Foundation

@MainActor
protocol SettingsViewModelProtocol: ObservableObject {
    var isTokenExist: Bool { get }
    func routeToTokenUpdate()
    func updateTokenState()
}

@Observable
final class SettingsViewModel: SettingsViewModelProtocol {
    
    // MARK: Properties
    
    var isTokenExist: Bool = false
    
    // MARK: Private properties
    
    private let keychainManager: KeychainManaging
    private let router: SettingsRouting
    
    // MARK: Initializer

    init(keychainManager: KeychainManaging,
         router: SettingsRouting
    ) {
        self.keychainManager = keychainManager
        self.router = router
    }
    
    // MARK: Functions
    
    func routeToTokenUpdate() {
        router.routeToTokenUpdate()
    }
    
    func updateTokenState() {
        Task {
            isTokenExist = await keychainManager.valueExists(forKey: AppConfig.KeychainKeys.token.rawValue)
        }
    }
}
