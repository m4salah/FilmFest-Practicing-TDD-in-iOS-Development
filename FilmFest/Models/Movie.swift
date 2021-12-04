//
//  Movie.swift
//  FilmFest
//
//  Created by Mohamed Abdelkhalek Salah on 30/11/2021.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
