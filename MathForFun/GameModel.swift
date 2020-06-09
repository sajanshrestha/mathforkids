//
//  GameModel.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation


class GameModel: ObservableObject {
    
    
    static var gameType: KinderGartenGameList.GameType = .comparing
    static var highestNumberOfItems = 20
    
    @Published private var game: Game = GameModel.createGame()
    
    private static func createGame() -> Game {
        Game(numberOfProblems: 10, highestNumberOfItems: highestNumberOfItems, gameType: gameType)
    }
    
    // MARK: ACCESS(ES)

    
    var problems: [Problem] {
        game.problems
    }
    
    var index: Int { game.index }
    
    var score: Int { game.score }
    
    var gameCompleted: Bool { game.gameCompleted }
    
    var processingAnswer: Bool { game.processingAnswer }
    
    func submitAnswer(with answer: String) -> Bool {
        game.processingAnswer = true
        return game.submitAnswer(with: answer)
        
    }
    
    func next()  {
        game.processingAnswer = false
        game.incrementIndex()
    }

    
}





