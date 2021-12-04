//
//  MovieManager.swift
//  FilmFest
//
//  Created by Mohamed Abdelkhalek Salah on 30/11/2021.
//

import Foundation

class MovieManager {
    var moviesToSeeCount: Int {
        return moviesToSeeArray.count
    }
    var moviesSeenCount: Int {
        return moviesSeenArray.count
    }
    
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
}



extension MovieManager {
    func AddMovie(_ movie: Movie) {
        if moviesToSeeArray.contains(movie) {
            return
        }
        moviesToSeeArray.append(movie)
    }
    
    func movieAt(index: Int) -> Movie {
        return moviesToSeeArray[index]
    }
    
    func checkOffMovieAt(index: Int) {
        guard index < moviesToSeeCount else {
            return
        }
        let checkedMovie = moviesToSeeArray.remove(at: index)
        moviesSeenArray.append(checkedMovie)
    }
    
    func checkedOffMovieAt(index: Int) -> Movie{
        return moviesSeenArray[index]
    }
    
    func clearArrays() {
        moviesSeenArray.removeAll()
        moviesToSeeArray.removeAll()
    }
}
