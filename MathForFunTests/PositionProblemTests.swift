//
//  PositionProblemTests.swift
//  MathForFunTests
//
//  Created by Sajan Shrestha on 8/19/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest
@testable import MathForFun

class PositionProblemTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Element_InitSetsContentNamePosition() throws {
        let element = PositionProblem.Element(content: "foo", name: "bar", position: .bottom)
        XCTAssertEqual(element.content, "foo")
        XCTAssertEqual(element.name, "bar")
        XCTAssertEqual(element.position, PositionProblem.Position.bottom)
    }
}
