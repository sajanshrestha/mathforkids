//
//  CountingGameModelTests.swift
//  MathForFunTests
//
//  Created by Sajan Shrestha on 6/4/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation



import XCTest
@testable import MathForFun

class CountingGameModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIndex() throws {
        
        // given
        let gameModel = CountingGameModel()
        gameModel.submitAnswer(with: "2")
        
        // when
        XCTAssertEqual(gameModel.index, 1)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
