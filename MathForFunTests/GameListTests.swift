//
//  GameListTests.swift
//  MathForFunTests
//
//  Created by Sajan Shrestha on 8/23/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest
@testable import MathForFun

class GameListTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAdditionGame_WhenInitialized_HasNameAndIdAsAddition() {
        let sut = GameList.Game.addition
        XCTAssertTrue(sut.id == "Addition" && sut.name == "Addition")
    }
    
    func testCountingGame_WhenInitialized_ShouldHaveFiveLevels() {
        let sut = GameList.Game.counting
        XCTAssertTrue(sut.numberOfLevels == 5)
    }
    
    func testGameList_WhenInitialized_GamesCountShouldBeEqualToAllCasesOfGame() {
        let sut = GameList()
        XCTAssertTrue(sut.games.count == GameList.Game.allCases.count)
    }
    
}
