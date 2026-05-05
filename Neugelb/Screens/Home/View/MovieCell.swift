//
//  MovieCell.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import NeugelbUI
import SwiftUI

struct MovieCell<ViewModel: MovieCellViewModelProtocol>: View {
    
    // MARK: Properties
    
    let viewModel: ViewModel
    let movie: UpcomingResponse.Movie
    
    // MARK: Private properties
    
    private let posterSize = UpcomingResponse.Movie.PosterSize.w154
    private let posterHeight: CGFloat = 80
    private let posterWidth: CGFloat = 80
    
    // MARK: Body
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: movie.posterURL(size: posterSize)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
                    .frame(width: posterWidth, height: posterHeight)
            }
            .frame(width: posterWidth, height: posterHeight)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.custom(type: .bold, size: .pt20))
                Text("Rating: \(movie.voteAverage, specifier: "%.1f")")
                    .font(.custom(type: .regular, size: .pt17))
                if let date = (viewModel.normalizedDate(movie.releaseDate)) {
                    Text("In cinemas from \(date)")
                        .font(.custom(type: .regular, size: .pt17))
                }
            }
            Spacer()
        }
        .padding(8)
        .background(Color(.black).opacity(0.1))
        .cornerRadius(8)
    }
}

#Preview {
    MovieCell(viewModel: MovieCellViewModelStub(),
              movie: UpcomingResponse.Movie.Stub.movie1)
}



//UpcomingResponse.Movie(
//    adult: false,
//    backdropPath: "/7bWxAsNPv9CXHOhZbJVlj2KxgfP.jpg",
//    genreIds: [27,53],
//    id: 713704,
//    originalLanguage: "en",
//    originalTitle: "Evil Dead Rise",
//    overview: "Two sisters find an ancient vinyl that gives birth to bloodthirsty demons that run amok in a Los Angeles apartment building and thrusts them into a primal battle for survival as they face the most nightmarish version of family imaginable.",
//    popularity: 1696.367,
//    posterPath: "/mIBCtPvKZQlxubxKMeViO2UrP3q.jpg",
//    releaseDate: "2023-04-12",
//    title: "Evil Dead Rise",
//    video: false,
//    voteAverage: 7,
//    voteCount: 207
//),
