//
//  IdentifyingObjectsProblemTests.swift
//  MathForFunTests
//
//  Created by Sajan Shrestha on 9/6/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest
@testable import MathForFun

class IdentifyingObjectsProblemTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_IdentifyingProblem_Init_ShouldSetBakgroundImageName() {
        
        let identifyingObject = IdentifyingObjectProblem.Object(name: "apple", emoji: "appleEmoji")
        
        let options = [
            identifyingObject,
            IdentifyingObjectProblem.Object(name: "banana", emoji: "bananaEmoji"),
            IdentifyingObjectProblem.Object(name: "cherry", emoji: "cherryEmoji"),
            IdentifyingObjectProblem.Object(name: "dragonfruit", emoji: "dragonfruitEmoji")
        ]
        
        let sut = IdentifyingObjectProblem(object: identifyingObject, options: options, backgroundImageName: "identifyingObject_1")
        
        XCTAssertEqual(sut.backgroundImageName, "identifyingObject_1")
    }
    
}
