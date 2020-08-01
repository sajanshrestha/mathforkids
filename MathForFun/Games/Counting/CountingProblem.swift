//
//  CountingProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/6/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

struct CountingProblem: Problem {
    
    let emoji: String
    let emojiCount: Int
    let emojiName: String
    
    var rightAnswer: String { String(emojiCount) }
    
    var options: [String] {
        String.getOptions(for: rightAnswer)
    }
    
    
    static func getProblems(count: Int, gameLevel: Int) -> [CountingProblem] {
        
        var problems = [CountingProblem]()
        
        let highestNumberOfItems = getHighestNumberOfItems(for: gameLevel)
        
        for _ in 0..<count {
            let randomEmoji = EmojiBank.emojis.randomElement()!
            let count = Int.random(in: 2...highestNumberOfItems)
            problems.append(CountingProblem(emoji: randomEmoji.key, emojiCount: count, emojiName: randomEmoji.value))
        }
        
        return problems
    }
    
    private static func getHighestNumberOfItems(for level: Int) -> Int {
        switch level {
        case 1:
            return 5
        case 2:
            return 7
        case 3:
            return 10
        case 4:
            return 15
        default:
            return 25
        }
    }
}



