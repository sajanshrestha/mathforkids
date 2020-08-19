//
//  ArithmeticProblemTests.swift
//  MathForFunTests
//
//  Created by Sajan Shrestha on 8/19/20.
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

    func test_Addition_2And2ShouldGiveFour() throws {
        let additionProblem = ArithmeticProblem.addition(firstNumber: 2, secondNumber: 2)
        XCTAssertEqual(additionProblem.rightAnswer, "4")
    }

    func test_Subtraction_6Minus2ShouldGiveFour() throws {
        let subtractionProblem = ArithmeticProblem.subtraction(firstNumber: 6, secondNumber: 2)
        XCTAssertEqual(subtractionProblem.rightAnswer, "4")
    }
    
    func test_Multiplication_6Multiply2ShouldGive12() throws {
        let multiplicationProblem = ArithmeticProblem.multiplication(firstNumber: 6, secondNumber: 2)
        XCTAssertEqual(multiplicationProblem.rightAnswer, "12")
    }

    func test_Division_6DividedBy2ShouldGive3() throws {
        let divisionProblem = ArithmeticProblem.division(firstNumber: 6, secondNumber: 2)
        XCTAssertEqual(divisionProblem.rightAnswer, "3")
    }
    
    func test_InitSetsOptions() throws {
        let problem = ArithmeticProblem.addition(firstNumber: 2, secondNumber: 2)
        XCTAssertEqual(problem.options.count, 4)
    }
}
