//
//  CountingGameModel.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/3/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation


class CountingGameModel: ObservableObject {
    
    @Published private var game: CountingGame = CountingGameModel.createCountingGame()
    
    static var highestCount = 3
    
    private static func createCountingGame() -> CountingGame {
        
        let emojis = ["🐒", "🎈", "🍎", "🐬", "🐘", "🐶", "🐸", "🐖", "🐿", "🐥", "🦆"]
        
        return CountingGame(numberOfProblems: 10, highestNumberOfItems: highestCount, emojis: emojis)
    }
         
    // MARK: ACCESS(ES)
    var problems: [CountingGame.CountingGameProblem] {
        game.problems
    }
    
    var index: Int {
        game.currentIndex
    }
    
    var score: Int {
        game.score
    }
    
    var gameOver: Bool {
        game.gameOver
    }

    
    // MARK: INTENTS
    func submitAnswer(with answer: String) -> Bool {
        game.submitAnswer(with: answer)
    }
    
}

