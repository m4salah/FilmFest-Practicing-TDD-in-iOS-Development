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
    var libraryVC: LibraryViewController!
    let fightClub = Movie(title: "Figh Club")
    let perfectStranger = Movie(title: "Perfect Strangers")
    let mousa = Movie(title: "Mousa")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewControllerID") as LibraryViewController
        _ = libraryVC.view
        libraryTableView = libraryVC.libraryTableView
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
    
    // MARK: - Section Two Row Count
    func testTableViewSectionTwoCount_ReturnsMoviesSeenCount() {
        sut.movieManager?.addMovie(fightClub)
        sut.movieManager?.addMovie(perfectStranger)
        sut.movieManager?.checkOffMovieAt(index: 0)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        sut.movieManager?.checkOffMovieAt(index: 0)
        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2)

    }
    
    // MARK: - Cells
    func testCell_RowAtIndex_ReturnsMovieCell() {
        sut.movieManager?.addMovie(mousa)
        libraryTableView.reloadData()
        
        let cell = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is MovieTableViewCell)
    }
    
    func testCell_ShouldDequeueCell() {
        let mock = TableViewMock()
        mock.delegate = sut
        mock.dataSource = sut
        
        mock.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
        
        sut.movieManager?.addMovie(fightClub)
        mock.reloadData()
        _ = mock.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mock.cellDequeuedProperly)
    }
}

extension MovieLibraryDataServiceTests {
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
}
