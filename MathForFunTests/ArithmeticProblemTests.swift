//
//  ArithmeticProblemTests.swift
//  MathForFunTests
//
//  Created by Sajan Shrestha on 6/25/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest
@testable import MathForFun

class ArithmeticProblemTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_addition_rightAnswerShouldBe30() throws {
        // given
        let problem = ArithmeticProblem.addition(firstNumber: 10, secondNumber: 20)
        
        // when
        let rightAnswer = problem.rightAnswer
        
        // then
        XCTAssertEqual(rightAnswer, "30")
    }
    
    func test_subtraction_rightAnswerShouldBe30() throws {
        // given
        let problem = ArithmeticProblem.subtraction(firstNumber: 10, secondNumber: 20)
        
        // when
        let rightAnswer = problem.rightAnswer
        
        // then
        XCTAssertEqual(rightAnswer, "10")
    }
    
    func test_subtraction_firstNumberShouldBeGreater() throws {
        // given
        let problem = ArithmeticProblem.subtraction(firstNumber: 10, secondNumber: 20)
        
        // when
        let firstNumber = problem.firstNumber
        
        // then
        XCTAssertEqual(firstNumber, 20)
    }
    
    func test_division_20dividedby10shouldbe2() throws {
        // given
        let problem = ArithmeticProblem.division(firstNumber: 20, secondNumber: 10)
        
        // when
        let rightAnswer = problem.rightAnswer
        
        // then
        XCTAssertEqual(rightAnswer, "2")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
