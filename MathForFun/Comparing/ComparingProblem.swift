//
//  ComparingProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/6/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

struct ComparingProblem: Problem {
    
    enum ComparingSet: String {
        case firstSet
        case secondSet
    }
    
    let firstSetCount: Int
    let secondSetCount: Int
    
    let firstSetEmoji: String
    let secondSetEmoji: String
    
    var rightAnswer: String {
        firstSetCount > secondSetCount ? ComparingSet.firstSet.rawValue : ComparingSet.secondSet.rawValue
    }
    
    var options: [String] = []
    
    
    static func getProblems(count: Int, gameLevel: Int) -> [ComparingProblem] {
        
        var problems = [ComparingProblem]()
        
        let highestNumberOfElements = getHighestNumberOfItems(for: gameLevel)
        
        for _ in 0..<count {
            
            let randomCounts = Array(1...highestNumberOfElements).randomElements(2)
                        
            let randomEmojis = emojisDictionary.randomElements(2)
            
            problems.append(ComparingProblem(firstSetCount: randomCounts[0], secondSetCount: randomCounts[1], firstSetEmoji: randomEmojis[0].key, secondSetEmoji: randomEmojis[1].key))

        }
        
        return problems
    }
    
    private static func getHighestNumberOfItems(for level: Int) -> Int {
        switch level {
        case 1:
            return 3
        case 2:
            return 5
        case 3:
            return 7
        case 4:
            return 9
        default:
            return 12
        }
    }
    
    // MARK: CONSTANTS
    private static let emojisDictionary = ["🐶": "dogs", "🐰": "bunnies", "🐻": "bears", "🦁": "lions", "🐵": "monkeys", "🦉": "owls", "🐢": "turtle", "🐬": "dolphins", "🦒": "giraffes", "🐑": "sheeps", "🐿": "squirrels", "🐓": "chickens", "🐫": "camels"]
    
}

