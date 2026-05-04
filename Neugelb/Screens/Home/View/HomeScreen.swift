//
//  HomeScreen.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import SwiftUI

struct HomeScreen<ViewModel: HomeViewModelProtocol>: View {
    
    // MARK: Properties
    
    @State var viewModel: ViewModel
    
    // MARK: Body
    
    var body: some View {
        EmptyView()
            .navigationTitle("Home")
    }
}

#Preview {
    HomeScreen(viewModel: HomeViewModel.Stub.viewModel)
}
