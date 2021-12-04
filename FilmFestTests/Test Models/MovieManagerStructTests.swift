//
//  MovieManagerStructTests.swift
//  FilmFestTests
//
//  Created by Mohamed Abdelkhalek Salah on 30/11/2021.
//

import XCTest
@testable import FilmFest

class MovieManagerStructTests: XCTestCase {

    var sut: MovieManager!
    let perfectStarngersMovie = Movie(title: "Perfect Strangers")
    let fightClubsMovie = Movie(title: "Fight club")
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Initial Values
    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: - Add & Query movies
    func testAdd_MoviesToSee_ReturnsOne() {
        sut.AddMovie(fightClubsMovie)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        sut.AddMovie(perfectStarngersMovie)
        let movieQueries = sut.movieAt(index: 0)
        XCTAssertEqual(perfectStarngersMovie.title, movieQueries.title)
    }
    
    // MARK: - Checking off
    func testCheckOffMovie_UpdatesMovieManagerCount() {
        sut.AddMovie(perfectStarngersMovie)
        sut.checkOffMovieAt(index: 0)

        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)

    }
    
    func testCheckOffMovie_RemoveMovieFromArray() {
        sut.AddMovie(perfectStarngersMovie)
        sut.AddMovie(fightClubsMovie)

        sut.checkOffMovieAt(index: 0)

        XCTAssertEqual(sut.movieAt(index: 0).title, fightClubsMovie.title)
    }
    
    func testCheckOffMovie_ReturnMovieAtIndex() {
        sut.AddMovie(perfectStarngersMovie)
        sut.checkOffMovieAt(index: 0)
        
        let movieQueried = sut.checkedOffMovieAt(index: 0)

        XCTAssertEqual(movieQueried.title, perfectStarngersMovie.title)
    }
    
    // MARK: - Clearing arrays
    func testClearArray_ReturnsArrayCountOfZero() {
        sut.AddMovie(fightClubsMovie)
        sut.AddMovie(perfectStarngersMovie)
        
        sut.checkOffMovieAt(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesSeenCount, 0)
        XCTAssertEqual(sut.moviesToSeeCount, 0)

    }
    
    // MARK: - Duplicates
    func testDuplicatedMovies_ShouldNotBeAddedToArray() {
        sut.AddMovie(fightClubsMovie)
        sut.AddMovie(fightClubsMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    

}
