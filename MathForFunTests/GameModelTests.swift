//
//  GameModelTests.swift
//  MathForFunTests
//
//  Created by Sajan Shrestha on 6/7/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest

@testable import MathForFun

class GameModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIndexShouldBeOne() throws {
        
        // given
        let sut = GameModel()
        
        // when
        let _ = sut.next()
        
        // then
        XCTAssertEqual(sut.index, 1)
        
    }
    
    func testGameShouldBeCompleted() throws {
        // given
        let sut = GameModel()
        
        // when
        for _ in 0..<sut.problems.count {
            let _ = sut.submitAnswer(with: "")
            sut.next()
        }
        
        // then
        XCTAssert(sut.gameCompleted)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
