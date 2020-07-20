//
//  ComparingProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/6/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//


import Foundation


enum ComparingProblem: Problem {
    
    enum ComparingSet: String {
        case firstSet
        case secondSet
    }
    
    case greaterThan(firstSetCount: Int, secondSetCount: Int, firstSetEmoji: String, secondSetEmoji: String)
    case lesserThan(firstSetCount: Int, secondSetCount: Int, firstSetEmoji: String, secondSetEmoji: String)
    
    
    var rightAnswer: String {
        switch self {
        case .greaterThan(let firstSetCount, let secondSetCount, _, _): return firstSetCount > secondSetCount ? ComparingSet.firstSet.rawValue : ComparingSet.secondSet.rawValue
        case .lesserThan(let firstSetCount, let secondSetCount, _, _): return firstSetCount < secondSetCount ? ComparingSet.firstSet.rawValue : ComparingSet.secondSet.rawValue
        }
    }
    
    var options: [String] {
        []
    }
    
    var firstSetCount: Int {
        switch self {
        case .greaterThan(let firstSetCount, _, _, _): return firstSetCount
        case .lesserThan(let firstSetCount, _, _, _): return firstSetCount
        }
    }
    var secondSetCount: Int {
        switch self {
        case .greaterThan(_, let secondSetCount, _, _): return secondSetCount
        case .lesserThan(_, let secondSetCount, _, _): return secondSetCount
        }
    }
    
    var firstSetEmoji: String {
        switch self {
        case .greaterThan(_, _, let firstSetEmoji, _): return firstSetEmoji
        case .lesserThan(_, _, let firstSetEmoji, _): return firstSetEmoji
        }
    }
    var secondSetEmoji: String {
        switch self {
        case .greaterThan(_, _, _, let secondSetEmoji): return secondSetEmoji
        case .lesserThan(_, _, _, let secondSetEmoji): return secondSetEmoji
        }
    }
    
    var questionText: String {
        switch self {
        case .greaterThan(_, _, _, _): return "Which box has more?"
        case .lesserThan(_, _, _, _): return "Which box has less?"
        }
    }
    
}



extension ComparingProblem {
    
    static func getProblems(count: Int, gameLevel: Int) -> [ComparingProblem] {
        
        var problems = [ComparingProblem]()
        
        let highestNumberOfElements = getHighestNumberOfItems(for: gameLevel)
        
        for _ in 0..<count {
            
            let randomCounts = Array(1...highestNumberOfElements).randomElements(2)
                        
            let randomEmojis = EmojiBank.emojis.randomElements(2)
            
            if gameLevel % 2 == 0 {
                problems.append(ComparingProblem.lesserThan(firstSetCount: randomCounts[0], secondSetCount: randomCounts[1], firstSetEmoji: randomEmojis[0].key, secondSetEmoji: randomEmojis[1].key))
            }
            else {
                problems.append(ComparingProblem.greaterThan(firstSetCount: randomCounts[0], secondSetCount: randomCounts[1], firstSetEmoji: randomEmojis[0].key, secondSetEmoji: randomEmojis[1].key))
            }
        }
        
        return problems
    }
    
    private static func getHighestNumberOfItems(for level: Int) -> Int {
        switch level {
        case 1:
            return 3
        case 2:
            return 3
        case 3:
            return 5
        case 4:
            return 5
        case 5:
            return 7
        case 6:
            return 7
        default:
            return 12
        }
    }
    
}
