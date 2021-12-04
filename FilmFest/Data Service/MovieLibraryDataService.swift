//
//  MovieLibraryDataService.swift
//  FilmFest
//
//  Created by Mohamed Abdelkhalek Salah on 02/12/2021.
//

import UIKit

enum LibrarySection: Int {
    case MoviesToSeeCount, MoviesSeenCount
}
class MovieLibraryDataService: NSObject, UITableViewDelegate, UITableViewDataSource {
    var movieManager: MovieManager?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let librarySection = LibrarySection(rawValue: section) else {
            fatalError()
        }
        switch librarySection {
            case .MoviesToSeeCount:
                return movieManager?.moviesToSeeCount ?? 0
            case .MoviesSeenCount:
                return movieManager?.moviesSeenCount ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

}
