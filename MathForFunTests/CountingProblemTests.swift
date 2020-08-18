//
//  CountingProblemTests.swift
//  MathForFunTests
//
//  Created by Sajan Shrestha on 8/18/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest
@testable import MathForFun

class CountingProblemTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Init_SetsEmojiEmojiCountAndName() throws {
        let countingProblem = CountingProblem(emoji: "emoji", emojiCount: 1, emojiName: "smiley")
        XCTAssertEqual(countingProblem.emoji, "emoji")
        XCTAssertEqual(countingProblem.emojiCount, 1)
        XCTAssertEqual(countingProblem.emojiName, "smiley")
    }

    func test_RightAnswer_IsEmojiCount() throws {
        let countingProblem = CountingProblem(emoji: "emoji", emojiCount: 1, emojiName: "smiley")
        XCTAssertEqual(countingProblem.rightAnswer, "\(countingProblem.emojiCount)")
    }
    
    
}
