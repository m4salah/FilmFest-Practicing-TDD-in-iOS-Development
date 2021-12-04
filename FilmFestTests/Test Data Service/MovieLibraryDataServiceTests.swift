//
//  MovieLibraryDataServiceTests.swift
//  FilmFestTests
//
//  Created by Mohamed Abdelkhalek Salah on 02/12/2021.
//

import XCTest
@testable import FilmFest

class MovieLibraryDataServiceTests: XCTestCase {

    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    
    let fightClub = Movie(title: "Figh Club")
    let perfectStranger = Movie(title: "Perfect Strangers")
    let mousa = Movie(title: "Mousa")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        libraryTableView = UITableView()
        libraryTableView.delegate = sut
        libraryTableView.dataSource = sut
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Sections
    func testTableViewSectionsCount_ReturnsTow() {
        let sectionCount = libraryTableView.numberOfSections
        XCTAssertEqual(sectionCount, 2)
    }
    
    // MARK: - Section One Row Count
    func testTableViewSectionOneCount_ReturnsMoviesToSeeCount() {
        sut.movieManager?.addMovie(fightClub)
        sut.movieManager?.addMovie(perfectStranger)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
        sut.movieManager?.addMovie(mousa)
        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)

    }
}
