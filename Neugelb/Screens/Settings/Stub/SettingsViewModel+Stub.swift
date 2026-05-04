//
//  SettingsViewModel+Stub.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

extension SettingsViewModel {
    @MainActor
    struct Stub {
        static let viewModel = SettingsViewModel(keychainManager: KeychainManager.Stub.Manager(),
                                                 router: SettingsRoutingStub())
    }
}
