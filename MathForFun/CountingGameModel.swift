//
//  PreKinderGardenGameModel.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

class CountingGameModel: ObservableObject {
    
    @Published private var countingGame: CountingGame = CountingGameModel.createCountingGame()
    
    static var highestCount = 3
    
    private static func createCountingGame() -> CountingGame {
        let emojisDictionary = [
            "🐶": "dogs",
            "🐰": "bunnies",
            "🐻": "bears",
            "🦁": "lions",
            "🐵": "monkeys",
            "🦉": "owls",
            "🐢": "turtle",
            "🐬": "dolphins",
            "🦒": "giraffes",
            "🐑": "sheeps",
            "🐿": "squirrels",
            "🐓": "chickens",
            "🐫": "camels"
        ]
        
        return CountingGame(numberOfProblems: 10, highestNumberOfItems: highestCount, emojisDictionary: emojisDictionary)
        
    }
    
    // MARK: ACCESS
    
    var problems: [CountingGame.CountingGameProblem] {
        countingGame.problems
    }
    
    var score: Int {
        countingGame.score
    }
    
    var gameOver: Bool {
        countingGame.gameOver
    }
    
    var index: Int {
        countingGame.currentIndex
    }
    
    func submitAnswer(with answer: String) -> Bool {
        countingGame.submitAnswer(with: answer)
    }
    
}
