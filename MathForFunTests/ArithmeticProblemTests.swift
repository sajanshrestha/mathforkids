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
    
    func test_WhenInitialized_SetsFirstSecondAndOptions() throws {
        let options = 20.generateOptions()
        let sut = ArithmeticProblem.addition(firstNumber: 10, secondNumber: 10, options: options)
        XCTAssertEqual(sut.firstNumber, 10)
        XCTAssertEqual(sut.secondNumber, 10)
        XCTAssertEqual(sut.options, options)
    }
 
    
    func test_AdditionProblem_RightAnswerShouldBe20() throws {
        let sut = ArithmeticProblem.addition(firstNumber: 10, secondNumber: 10, options: 20.generateOptions())
        XCTAssertEqual(sut.rightAnswer, "20")
        
    }
    
    func test_SubtractionProblem_RightAnswerShouldBe10() throws {
        let sut = ArithmeticProblem.subtraction(firstNumber: 20, secondNumber: 10, options: 10.generateOptions())
        XCTAssertEqual(sut.rightAnswer, "10")
        
    }
    
    func test_MultiplicationProblem_RightAnswerShouldBe100() throws {
        let sut = ArithmeticProblem.multiplication(firstNumber: 10, secondNumber: 10, options: 100.generateOptions())
        XCTAssertEqual(sut.rightAnswer, "100")
        
    }
    
    func test_AdditionProblem_RightAnswerShouldBe2() throws {
        let sut = ArithmeticProblem.division(firstNumber: 4, secondNumber: 2, options: 2.generateOptions())
        XCTAssertEqual(sut.rightAnswer, "2")
        
    }
    
    func test_GetProblems_ShouldReturn10Problems() throws {
        let sut = ArithmeticProblem.getProblems(count: 10, gameLevel: 1, for: .addition)
        XCTAssertEqual(sut.count, 10)
    }
    
    func test_WhenDivisionProblemIsInitialize_OperationShouldBeDivision() throws {
        let sut = ArithmeticProblem.division(firstNumber: 10, secondNumber: 2, options: 5.generateOptions())
        XCTAssertEqual(sut.arithmeticOperation, ArithmeticProblem.ArithmeticOperation.division)
    }
}
