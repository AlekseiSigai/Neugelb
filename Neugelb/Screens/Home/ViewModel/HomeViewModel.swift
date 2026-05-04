//
//  HomeViewModel.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import Combine
import Foundation

@MainActor
protocol HomeViewModelProtocol: ObservableObject {

}

@Observable
final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: Private properties
    
    private let router: HomeRouting
    
    // MARK: Initializer
    
    init(router: HomeRouting) {
        self.router = router
    }
}
