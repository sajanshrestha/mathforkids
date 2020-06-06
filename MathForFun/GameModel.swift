//
//  GameModel.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation
import UIKit



struct ExerciseSession {
    
    var problems: [Problem]
    
    var index = 0
    
    var score = 0
    
    var gameCompleted = false
    
    init(numberOfProblems: Int) {
        
        problems = [
            
        ]
    }
    
    func isCorrect(_ answer: String) -> Bool {
        
        let currentProblem = problems[index]
        return currentProblem.answer == answer
        
    }
    
    mutating func submitAnswer(_ answer: String) {
        
        if isCorrect(answer) {
            score += 1
        }
        incrementIndex()
    }
    
    mutating func incrementIndex() {
        if index < problems.count - 1{
            index += 1
        }
        else {
            gameCompleted = true
        }
    }
    
    
    struct CountingProblem: Problem {
        
        let content: String
        let count: Int
        
        var answer: String {
            String(count)
        }
        
        var options: [String] { return ["a", "b", "c", "d"] }
    }
    
}

protocol Problem {
    var answer: String { get }
    var options: [String] { get }
}


class ExerciseSessionModel: ObservableObject {
    
    // this part should decide what kind of problem to send
    @Published private var session = ExerciseSessionModel.createExerciseSession()
    
    private static func createExerciseSession() -> ExerciseSession {
        ExerciseSession(numberOfProblems: 10)
    }
    
    var problems: [Problem] {
        session.problems
    }
    
    var score: Int {
        session.score
    }
    
    var index: Int {
        session.index
    }
    
    var gameCompleted: Bool {
        session.gameCompleted
    }
    
    func submitAnswer(_ answer: String) {
        session.submitAnswer(answer)
    }
    
}
