//
//  MainScreen.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import SwiftUI
import Router

struct MainScreen<ViewModel: MainViewModelProtocol>: View {
    
    // MARK: Properties
    
    @State var viewModel: ViewModel
    
    // MARK: Body
    
    var body: some View {
        TabView(selection: $viewModel.router.selectedTab) {
            Tab("Home", systemImage: "house", value: .tab0) {
                viewModel.router.rootView(HomeFactory.create(), for: .tab0)
            }
            Tab("Settings", systemImage: "gearshape", value: .tab1) {
                viewModel.router.rootView(SettingsFactory.create(), for: .tab1)
            }
        }
    }
}
