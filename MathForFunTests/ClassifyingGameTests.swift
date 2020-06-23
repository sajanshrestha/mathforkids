//
//  ClassifyingGameTests.swift
//  MathForFunTests
//
//  Created by Sajan Shrestha on 6/22/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest
@testable import MathForFun

class ClassifyingGameTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_levelOneProblem_whenCreated_rightAnswerShouldBeUniqueEmoji() throws {
        
        let problems = ClassifyingProblem.getProblems(count: 1, gameLevel: 1)
        
        let problem = problems.first!
        
        let emojis = problem.items.map { $0.content }
        
        if let uniqueEmoji = emojis.uniqueElement() {
            XCTAssertEqual(problem.rightAnswer, uniqueEmoji)
        }
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
