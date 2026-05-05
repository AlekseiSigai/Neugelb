//
//  MainViewModel.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Combine
import Foundation

@MainActor
protocol MainViewModelProtocol: ObservableObject {
    var router: MainRouting { get set }
}

@Observable
final class MainViewModel: MainViewModelProtocol {
    
    // MARK: Properties
    
    var router: MainRouting
    
    // MARK: Initializer
    
    init(router: MainRouting) {
        self.router = router
    }
}
