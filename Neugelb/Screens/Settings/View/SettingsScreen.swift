//
//  SettingsScreen.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import SwiftUI

struct SettingsScreen<ViewModel: SettingsViewModelProtocol>: View {
    
    // MARK: Properties
    
    @State var viewModel: ViewModel
    
    // MARK: Body
    
    var body: some View {
        VStack {
            if viewModel.isTokenExist {
                VStack(spacing: 20) {
                    Text("Token was saved")
                    Button("Update token") {
                        viewModel.routeToTokenUpdate()
                    }
                }
            } else {
                VStack(spacing: 20) {
                    Text("Token not found")
                    Button("Add token") {
                        viewModel.routeToTokenUpdate()
                    }
                }
            }
        }
            .navigationTitle("Settings")
            .onAppear {
                viewModel.updateTokenState()
            }
    }
}

#Preview {
    SettingsScreen(viewModel: SettingsViewModel.Stub.viewModel)
}
