//
//  MovieStructTests.swift
//  FilmFestTests
//
//  Created by Mohamed Abdelkhalek Salah on 30/11/2021.
//

import XCTest
@testable import FilmFest

class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Shawshank Redemption")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Shawshank Redemption")
    }
    
    func testInit_SetMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Shawshank Redemption", releaseDate: "2021")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Shawshank Redemption")
        XCTAssertEqual(testMovie.releaseDate, "2021")

    }
    
    func testEqutable_ReturnsTrue() {
        let movie1 = Movie(title: "Shawshank Redemption")
        let movie2 = Movie(title: "Shawshank Redemption")
        
        XCTAssertEqual(movie1, movie2)
    }
    
    func testEqutable_ReturnsFalseForDifferntTitle() {
        let movie1 = Movie(title: "Shawshank Redemption1")
        let movie2 = Movie(title: "Shawshank Redemption")
        
        XCTAssertNotEqual(movie1, movie2)
    }
    
    func testEqutable_ReturnsFalseForDifferntReleaseDate() {
        let movie1 = Movie(title: "Shawshank Redemption", releaseDate: "2021")
        let movie2 = Movie(title: "Shawshank Redemption", releaseDate: "2020")
        
        XCTAssertNotEqual(movie1, movie2)
    }

}
