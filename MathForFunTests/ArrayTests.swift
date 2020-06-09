//
//  ArrayTests.swift
//  MathForFunTests
//
//  Created by Sajan Shrestha on 6/9/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest

@testable import MathForFun

class ArrayTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldReturnDifferentRandomElements() throws {
        
        let sut = [1, 2, 3, 4, 5, 6]
        
        let randomIntegers = sut.randomElements(2)
        
        XCTAssertNotEqual(randomIntegers[0], randomIntegers[1])
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
