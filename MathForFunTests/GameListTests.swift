//
//  GameListTests.swift
//  MathForFunTests
//
//  Created by Sajan Shrestha on 8/19/20.
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

    func test_WhenInitialized_WillHaveSameAmountOfGamesAsGameTypeCases() throws {
        let gameList = GameList()
        let gameTypeCasesCount = GameList.GameType.allCases.count
        
        XCTAssertEqual(gameList.games.count, gameTypeCasesCount)
    }
    
    func test_GameWhenInitialized_setsIdAndGameType() throws {
        
        let game = GameList.Game(id: 1, gameType: .counting)
        
        XCTAssertEqual(game.id, 1)
        XCTAssertEqual(game.gameType, GameList.GameType.counting)
    }
    
    func test_GameType_CountingName_EqualsCounting() throws {
        XCTAssertEqual(GameList.GameType.counting.name, "Counting")
    }
}
