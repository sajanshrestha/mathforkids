//
//  Game.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/6/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import UIKit

struct GameSession {
    
    var problems = [Problem]()
    
    var game: GameList.Game
    
    var currentIndex = 0
    var score = 0
    var sessionCompleted = false
    var processingAnswer = false
    
    var lastProblem: Bool {
        currentIndex == problems.count - 1
    }
    
    private let numberOfProblems = 10
    
    init(game: GameList.Game, gameLevel: Int) {
        
        self.game = game
        self.createGame(for: gameLevel)
         
    }
    
    private mutating func createGame(for gameLevel: Int) {
        
        switch game {
            
        case .counting:
            problems.append(contentsOf: CountingProblem.getProblems(count: numberOfProblems, gameLevel: gameLevel))
            
        case .identifyingColor:
            problems.append(contentsOf: IdentifyingColorProblem.getProblems(count: numberOfProblems, level: gameLevel))

        case .identifyingShape:
            if gameLevel < 4 {
                problems.append(contentsOf: ShapeProblem.getProblems(count: numberOfProblems, level: gameLevel))
            }
            else {
                problems.append(contentsOf: ShapedObjectProblem.getProblems(count: numberOfProblems))
            }
        case .comparing:
            problems.append(contentsOf: ComparingProblem.getProblems(count: numberOfProblems, gameLevel: gameLevel))

        case .position:
            problems.append(contentsOf: PositionProblem.getProblems(count: numberOfProblems, gameLevel: gameLevel))

        case .classifying:
            problems.append(contentsOf: ClassifyingProblem.getProblems(count: numberOfProblems, gameLevel: gameLevel))
            
        case .addition:
            problems.append(contentsOf: ArithmeticProblem.getProblems(count: numberOfProblems, gameLevel: gameLevel, for: .addition))
            
        case .subtraction:
            problems.append(contentsOf: ArithmeticProblem.getProblems(count: numberOfProblems, gameLevel: gameLevel, for: .subtraction))

        case .multiplication:
            problems.append(contentsOf: ArithmeticProblem.getProblems(count: numberOfProblems, gameLevel: gameLevel, for: .multiplication))
            
        case .division:
            problems.append(contentsOf: ArithmeticProblem.getProblems(count: numberOfProblems, gameLevel: gameLevel, for: .division))
            
        case .identifyingObjects:
            problems.append(contentsOf: IdentifyingObjectProblem.getProblems(count: numberOfProblems, gameLevel: gameLevel))
            
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

