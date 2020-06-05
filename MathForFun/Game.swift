//
//  CountingGame.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/3/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation


struct CountingGame {
    
    private(set) var problems: [CountingGameProblem]
    
    private(set) var currentIndex = 0
    
    private(set) var score = 0
    
    private(set) var gameOver = false
        
    init(numberOfProblems: Int, highestNumberOfItems: Int, emojis: [String]) {
                
        problems = [CountingGameProblem]()
        
        for _ in 0..<numberOfProblems {
            let randomEmoji = emojis.randomElement()!
            let count = Int.random(in: 1...highestNumberOfItems)
            problems.append(CountingGameProblem(emoji: randomEmoji, countOfItems: count))
        }
        
    }
    
    private func answerCorrect(_ answer: String) -> Bool {
        problems[currentIndex].rightAnswer == Int(answer)!
    }
    
    mutating func submitAnswer(with answer: String) -> Bool {
        
        if answerCorrect(answer) {
            
            score += 1
            incrementIndex()
            return true
        }
            
        else {
            incrementIndex()
            return false
        }
    }
    
    private mutating func incrementIndex() {
        
        if currentIndex < problems.count - 1 {
            currentIndex += 1
        }
            
        else {
            print("Score is \(score)")
            gameOver = true
        }
    }
    
    
    struct CountingGameProblem {
        
        var emoji: String
        var countOfItems: Int
        var options: [Int] {
            
            var options = [Int]()
            
            let firstOption = rightAnswer > 1 ? rightAnswer - 1 : rightAnswer + 1
            let secondOption = rightAnswer > 2 ? rightAnswer - 2 : rightAnswer + 2
            let thirdOption = rightAnswer > 3 ? rightAnswer - 3 : rightAnswer + 3
            
            options.append(contentsOf: [rightAnswer, firstOption, secondOption, thirdOption])
            
            return options.shuffled()
            
        }
        var rightAnswer: Int { countOfItems }
    }
    
}


