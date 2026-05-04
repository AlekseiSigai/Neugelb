//
//  MainFactory.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Router
import SwiftUI

final class MainFactory {
    @MainActor
    static public func create() -> some View {
        let viewModel = MainViewModel(router: Router.shared)
        
        return MainScreen(viewModel: viewModel)
    }
}
