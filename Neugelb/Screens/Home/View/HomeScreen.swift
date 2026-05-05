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
        ScrollView {
            LazyVStack {
                ForEach(viewModel.movies) { movie in
                    MovieCell(viewModel: viewModel,
                              movie: movie)
                        .onAppear {
                            viewModel.fetchMoreMoviesIfNeeded(afterID: movie.id)
                        }
                        .onTapGesture {
                            viewModel.routeToDetails(movie: movie)
                        }
                }
            }
        }
        .padding(16)
        .onAppear {
            viewModel.loadFirstMovies()
        }
        .navigationTitle("Home")
    }
}

#Preview {
    HomeScreen(viewModel: HomeViewModel.Stub.viewModel)
}
