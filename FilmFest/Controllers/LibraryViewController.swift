//
//  LibraryViewController.swift
//  FilmFest
//
//  Created by Mohamed Abdelkhalek Salah on 30/11/2021.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libraryTableView.dataSource = dataService
        libraryTableView.delegate = dataService
    }


}

