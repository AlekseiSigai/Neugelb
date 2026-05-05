//
//  UpcomingMoviesFetching+Stub.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

struct UpcomingMoviesFetchingStub: UpcomingMoviesFetching {
    func fetchUpcomingMovies(page: Int, apiToken: String) async throws -> UpcomingResponse {
        UpcomingResponse(
            dates: UpcomingResponse.Dates(maximum: "2023-05-23",
                                          minimum: "2023-05-04"),
            page: 1,
            results: [
                UpcomingResponse.Movie(
                    adult: false,
                    backdropPath: "/7bWxAsNPv9CXHOhZbJVlj2KxgfP.jpg",
                    genreIds: [27,53],
                    id: 713704,
                    originalLanguage: "en",
                    originalTitle: "Evil Dead Rise",
                    overview: "Two sisters find an ancient vinyl that gives birth to bloodthirsty demons that run amok in a Los Angeles apartment building and thrusts them into a primal battle for survival as they face the most nightmarish version of family imaginable.",
                    popularity: 1696.367,
                    posterPath: "/mIBCtPvKZQlxubxKMeViO2UrP3q.jpg",
                    releaseDate: "2023-04-12",
                    title: "Evil Dead Rise",
                    video: false,
                    voteAverage: 7,
                    voteCount: 207
                ),
                UpcomingResponse.Movie(
                    adult: false,
                    backdropPath: "/5Y5pz0NX7SZS9036I733F7uNcwK.jpg",
                    genreIds: [27,53],
                    id: 758323,
                    originalLanguage: "en",
                    originalTitle: "The Pope's Exorcist",
                    overview: "Father Gabriele Amorth, Chief Exorcist of the Vatican, investigates a young boy's terrifying possession and ends up uncovering a centuries-old conspiracy the Vatican has desperately tried to keep hidden.",
                    popularity: 1073.229,
                    posterPath: "/9JBEPLTPSm0d1mbEcLxULjJq9Eh.jpg",
                    releaseDate: "2023-04-05",
                    title: "The Pope's Exorcist",
                    video: false,
                    voteAverage: 6.5,
                    voteCount: 143
                ),
                UpcomingResponse.Movie(
                    adult: false,
                    backdropPath: "/wD2kUCX1Bb6oeIb2uz7kbdfLP6k.jpg",
                    genreIds: [27,53],
                    id: 980078,
                    originalLanguage: "en",
                    originalTitle: "Winnie the Pooh: Blood and Honey",
                    overview: "Christopher Robin is headed off to college and he has abandoned his old friends, Pooh and Piglet, which then leads to the duo embracing their inner monsters.",
                    popularity: 690.338,
                    posterPath: "/ewF3IlGscc7FjgGEPcQvZsAsgAW.jpg",
                    releaseDate: "2023-01-27",
                    title: "Winnie the Pooh: Blood and Honey",
                    video: false,
                    voteAverage: 5.8,
                    voteCount: 517
                ),
                UpcomingResponse.Movie(
                    adult: false,
                    backdropPath: "/sp7MPK2K60LLd7A6zjHKsfgjFil.jpg",
                    genreIds: [27,53],
                    id: 296271,
                    originalLanguage: "en",
                    originalTitle: "The Devil Conspiracy",
                    overview: "The hottest biotech company in the world has discovered they can clone history’s most influential people from the dead. Now, they are auctioning clones of Michelangelo, Galileo, Vivaldi, and others for tens of millions of dollars to the world’s ultra-rich. But when they steal the Shroud of Turin and clone the DNA of Jesus Christ, all hell breaks loose.",
                    popularity: 615.365,
                    posterPath: "/2lUYbD2C3XSuwqMUbDVDQuz9mqz.jpg",
                    releaseDate: "2023-01-13",
                    title: "The Devil Conspiracy",
                    video: false,
                    voteAverage: 6.3,
                    voteCount: 129
                ),
                UpcomingResponse.Movie(
                    adult: false,
                    backdropPath: "/fI5RsaM0NSU6TqztRhA2pal5ezv.jpg",
                    genreIds: [28,80,53],
                    id: 385687,
                    originalLanguage: "en",
                    originalTitle: "Fast X",
                    overview: "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.",
                    popularity: 524.606,
                    posterPath: "/jwMMQR69Xz9AYtX4u2uYJgfAAev.jpg",
                    releaseDate: "2023-05-17",
                    title: "Fast X",
                    video: false,
                    voteAverage: 0,
                    voteCount: 0
                ),
                UpcomingResponse.Movie(
                    adult: false,
                    backdropPath: "/94TIUEhuwv8PhdIADEvSuwPljS5.jpg",
                    genreIds: [10752,28],
                    id: 840326,
                    originalLanguage: "fi",
                    originalTitle: "Sisu",
                    overview: "Deep in the wilderness of Lapland, Aatami Korpi is searching for gold but after he stumbles upon Nazi patrol, a breathtaking and gold-hungry chase through the destroyed and mined Lapland wilderness begins.",
                    popularity: 364.899,
                    posterPath: "/dHx5yuBb05U9vNaNhIBD7jWyxPk.jpg",
                    releaseDate: "2023-01-27",
                    title: "Sisu",
                    video: false,
                    voteAverage: 6.9,
                    voteCount: 16
                ),
            ],
            totalPages: 19,
            totalResults: 369
        )
    }
}
