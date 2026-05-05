//
//  DetailsViewModel.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 05.05.26.
//

import Combine
import Foundation
import NGFoundation

@MainActor
protocol DetailsViewModelProtocol: ObservableObject {
    var movie: UpcomingResponse.Movie { get }
    func normalizedDate(_ date: String) -> String?
    func routeBack()
}

@Observable
final class DetailsViewModel: DetailsViewModelProtocol {
    
    // MARK: Properties
    
    let movie: UpcomingResponse.Movie
    
    // MARK: Private properties
    
    private let router: DetailsRouting
    
    // MARK: Initializer

    init(movie: UpcomingResponse.Movie,
         router: DetailsRouting
    ) {
        self.movie = movie
        self.router = router
    }
    
    // MARK: Functions
    
    func normalizedDate(_ date: String) -> String? {
        guard let date = CustomDateFormatter.themoviedb.date(from: date) else { return nil }
        
        return CustomDateFormatter.longGB.string(from: date)
    }
    
    func routeBack() {
        router.routeBack()
    }
}
