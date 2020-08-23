//
//  GameListViewTests.swift
//  MathForFunTests
//
//  Created by Sajan Shrestha on 8/23/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest
@testable import MathForFun


class GameListViewTests: XCTestCase {
    
    var sut: GameListView!

    override func setUpWithError() throws {
        sut = GameListView(gameList: GameList())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGameListView_WhenInitialized_SetsGameList() {
        
        XCTAssertNotNil(sut.gameList)
    }

    func testGameList_WhenInit_UsernameShouldEqualUsernameFromUserDefault() {
        
        guard let usernameFromUserDefaults = UserDefaults.getUserName() else { return }
        XCTAssertEqual(sut.username, usernameFromUserDefaults)
    }
}
