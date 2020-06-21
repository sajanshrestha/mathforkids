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
        
        var options = [String]()
        
        let rightAnswerInt = Int(rightAnswer)!
        
        let firstOption = rightAnswerInt > 1 ? rightAnswerInt - 1 : rightAnswerInt + 1
        let secondOption = rightAnswerInt > 2 ? rightAnswerInt - 2 : rightAnswerInt + 2
        let thirdOption = rightAnswerInt > 3 ? rightAnswerInt - 3 : rightAnswerInt + 3
        
        options.append(contentsOf: [rightAnswer, String(firstOption), String(secondOption), String(thirdOption)])
        
        return options.shuffled()
        
    }
    
    
    static func getProblems(count: Int, gameLevel: Int) -> [CountingProblem] {
        
        var problems = [CountingProblem]()
        
        let highestNumberOfItems = getHighestNumberOfItems(for: gameLevel)
        
        for _ in 0..<count {
            let randomEmoji = emojisDictionary.randomElement()!
            let count = Int.random(in: 1...highestNumberOfItems)
            problems.append(CountingProblem(emoji: randomEmoji.key, emojiCount: count, emojiName: randomEmoji.value))
        }
        
        return problems
    }
    
    private static func getHighestNumberOfItems(for level: Int) -> Int {
        switch level {
        case 1:
            return 3
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
    
    private static let emojisDictionary = ["🐶": "dogs", "🐰": "bunnies", "🐻": "bears", "🦁": "lions", "🐵": "monkeys", "🦉": "owls", "🐢": "turtle", "🐬": "dolphins", "🦒": "giraffes", "🐑": "sheeps", "🐿": "squirrels", "🐓": "chickens", "🐫": "camels"]
    
}



