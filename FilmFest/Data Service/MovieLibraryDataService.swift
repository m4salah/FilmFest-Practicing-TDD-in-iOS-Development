//
//  MovieLibraryDataService.swift
//  FilmFest
//
//  Created by Mohamed Abdelkhalek Salah on 02/12/2021.
//

import UIKit

class MovieLibraryDataService: NSObject, UITableViewDelegate, UITableViewDataSource {
    var movieManager: MovieManager?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieManager?.moviesToSeeCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

}
