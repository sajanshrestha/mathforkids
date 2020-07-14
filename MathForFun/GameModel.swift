//
//  GameModel.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

class GameModel: ObservableObject {
    
    
    static var gameType: GameList.GameType = .comparing
    static var gameLevel = 1


    @Published private var game: GameSession = GameModel.createGame()
    
    private static func createGame() -> GameSession {
        GameSession(gameType: gameType, gameLevel: gameLevel)
    }
    
    // MARK: ACCESS(ES)

    var problems: [Problem] {
        game.problems
    }
    
    var index: Int { game.currentIndex }
    
    var score: Int { game.score }
    
    var gameCompleted: Bool { game.sessionCompleted }
    
    var processingAnswer: Bool { game.processingAnswer }
        
    var lastProblemOn: Bool { game.lastProblem }
    
    func submitAnswer(with answer: String) -> Bool {
        
        game.processingAnswer = true
        
        let answerCorrect = game.submitAnswer(with: answer)
        
        notifyUser(for: answerCorrect)
        
        return answerCorrect
    }
    
    func next()  {
        game.processingAnswer = false
        game.incrementIndex()
    }
    
    private func notifyUser(for answerCorrect: Bool) {
        if answerCorrect {
            AudioPlayer.playCorrectSound()
        }
        else {
            AudioPlayer.playIncorrectSound()
        }
    }
}
