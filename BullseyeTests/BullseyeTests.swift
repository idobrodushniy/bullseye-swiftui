//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Ilia on 16.10.2022.
//

import XCTest
@testable import Bullseye

final class BullseyeTests: XCTestCase {
    var game: Game!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }

    func testScorePositive() throws {
        XCTAssertEqual(game.points(sliderValue: game.target + 5), 95)
    }
    
    func testScoreNegative() throws {
        XCTAssertEqual(game.points(sliderValue: game.target - 5), 95)
    }
    
    func testScoreExactMatch() throws {
        XCTAssertEqual(game.points(sliderValue: game.target), 200)
    }
    
    func testScoreOneOf() throws {
        XCTAssertEqual(game.points(sliderValue: game.target + 2), 98 + 50)
    }
    
    func testNewRound(){
        let previousTarget = game.target
        game.startNewRound(points: 100)
        
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
        XCTAssertNotEqual(game.target, previousTarget)
    }
    
    func testRestart(){
        var previousTarget = game.target
        game.startNewRound(points: 100)
        
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
        XCTAssertNotEqual(game.target, previousTarget)
        
        previousTarget = game.target
        game.restart()
        
        XCTAssertEqual(game.score,0)
        XCTAssertEqual(game.round, 1)
        XCTAssertNotEqual(game.target, previousTarget)
        
    }
    
    func testLeaderboard(){
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderboardEntries.count, 1)
        XCTAssertEqual(game.leaderboardEntries[0].score, 100)
        
        game.startNewRound(points:200)
        XCTAssertEqual(game.leaderboardEntries.count, 2)
        XCTAssertEqual(game.leaderboardEntries[0].score, 200)
        XCTAssertEqual(game.leaderboardEntries[1].score, 100)
    }
    
}
