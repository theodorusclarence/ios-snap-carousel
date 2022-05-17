//
//  Movie.swift
//  movie-carousel
//
//  Created by Clarence on 16/05/22.
//

import SwiftUI

struct Movie: Identifiable {
    var id = UUID().uuidString
    var movieTitle: String
    var artwork: String
}

var movies: [Movie] = [
    Movie(movieTitle: "The Maze Runner", artwork: "movie1"),
    Movie(movieTitle: "Interstellar", artwork: "movie2"),
    Movie(movieTitle: "Godzilla", artwork: "movie3"),
    Movie(movieTitle: "X-Man", artwork: "movie4"),
    Movie(movieTitle: "Birdman", artwork: "movie5"),
    Movie(movieTitle: "Under the Skin", artwork: "movie6"),
    Movie(movieTitle: "Fury", artwork: "movie7"),
]
