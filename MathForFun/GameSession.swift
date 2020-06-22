//
//  Game.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/6/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import UIKit

protocol Problem {
    var rightAnswer: String { get }
    var options: [String] { get }
}


struct GameSession {
    
    var problems = [Problem]()
    
    var gameType: GameList.GameType
    
    var currentIndex = 0
    var score = 0
    var sessionCompleted = false
    var processingAnswer = false
    
    private let numberOfProblems = 10
    
    init(gameType: GameList.GameType, gameLevel: Int) {
        
        self.gameType = gameType
        self.createGame(for: gameLevel)
         
    }
    
    private mutating func createGame(for gameLevel: Int) {
        
        switch gameType {
            
        case .counting:
            problems.append(contentsOf: CountingProblem.getProblems(count: numberOfProblems, gameLevel: gameLevel))
            
        case .identifyingColor:
            problems.append(contentsOf: IdentifyingColorProblem.getProblems(count: numberOfProblems, level: gameLevel))

            
        case .identifyingShape:
            problems.append(contentsOf: IdentifyingShapeProblem.getProblems(count: numberOfProblems, level: gameLevel))

        case .comparing:
            problems.append(contentsOf: ComparingProblem.getProblems(count: numberOfProblems, gameLevel: gameLevel))

        case .position:
            problems.append(contentsOf: PositionProblem.getProblems(count: numberOfProblems))

        case .classifying:
            problems.append(contentsOf: ClassifyingProblem.getProblems(count: numberOfProblems, gameLevel: gameLevel))
        }
    }
}


extension GameSession {
    
    private func answerCorrect(_ answer: String) -> Bool {
        problems[currentIndex].rightAnswer == answer
    }
    
    mutating func submitAnswer(with answer: String) -> Bool {
        
        if answerCorrect(answer) {
            
            score += 1
            return true
        }
            
        else {
            return false
        }
    }
    
    mutating func incrementIndex() {
        
        if currentIndex < problems.count - 1 {
            currentIndex += 1
        }
            
        else {
            sessionCompleted = true
        }
    }
}

