//
//  TokenUpdateScreen.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import NGFoundation
import SwiftUI

struct TokenUpdateScreen<ViewModel: TokenUpdateViewModelProtocol>: View {
    
    @State var viewModel: ViewModel
    
    // MARK: Private properties
    
    @State private var token: String = .empty
    
    // MARK: Body
    
    var body: some View {
        VStack {
            TextEditor(text: $token)
                .frame(height: 200)
                .border(Color.gray)
                .padding()
            
            Button("Update") {
                viewModel.updateToken(token)
            }
        }
            .navigationTitle("Token update")
    }
}

#Preview {
    TokenUpdateScreen(viewModel: TokenUpdateViewModel.Stub.viewModel)
}
