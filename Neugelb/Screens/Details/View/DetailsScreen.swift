//
//  DetailsScreen.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 05.05.26.
//

import SwiftUI
import NeugelbUI

struct DetailsScreen<ViewModel: DetailsViewModelProtocol>: View {
    
    // MARK: Properties
    
    @State var viewModel: ViewModel
    
    // MARK: Private properties
    
    private let posterSize = UpcomingResponse.Movie.PosterSize.w342
    private let posterHeight: CGFloat = 300
    
    // MARK: Body
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            
            ScrollView {
                VStack {
                    AsyncImage(url: viewModel.movie.posterURL(size: posterSize)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                            .frame(width: width, height: posterHeight)
                    }
                    .frame(width: width)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viewModel.movie.title)
                                .font(.custom(type: .bold, size: .pt20))
                            Text("Rating: \(viewModel.movie.voteAverage, specifier: "%.1f")")
                                .font(.custom(type: .regular, size: .pt17))
                            if let date = (viewModel.normalizedDate(viewModel.movie.releaseDate)) {
                                Text("In cinemas from \(date)")
                                    .font(.custom(type: .regular, size: .pt17))
                            }
                        }
                        Spacer()
                    }
                    .padding(16)
                    
                    Text(viewModel.movie.overview)
                        .font(.custom(type: .regular, size: .pt17))
                        .padding(16)
                }
            }
            
        }
        .navigationTitle("Details")
    }
}

#Preview {
    DetailsScreen(viewModel: DetailsViewModel.Stub.viewModel)
}
