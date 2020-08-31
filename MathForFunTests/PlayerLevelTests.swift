//
//  PlayerLevelTests.swift
//  MathForFunTests
//
//  Created by Sajan Shrestha on 8/23/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest
@testable import MathForFun

class PlayerLevelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_PlayerLevel_WhenInitialized_CurrentLevelsIsNotEmpty() {
        let sut = PlayerLevel()
        XCTAssertFalse(sut.currentLevels.isEmpty)
    }
}
