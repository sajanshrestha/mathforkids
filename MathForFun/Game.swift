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


struct Game {
    
    var problems = [Problem]()
    
    var index = 0
    var score = 0
    var gameCompleted = false
    var processingAnswer = false
    
    init(numberOfProblems: Int, highestNumberOfItems: Int, gameType: KinderGartenGameList.GameType) {
                
        switch gameType {
            
        case .counting:
            self.createCountingGame(numberOfProblems, highestNumberOfItems)
            
        case .identifyingColor:
            self.createIdentifyingColorGame()
            
        case .identifyingShape:
            self.createIdentifyingShapeGame()
             
        case .comparing:
            self.createComparingGame(numberOfProblems, highestNumberOfItems)
            
        case .position:
            self.createPositionGame(numberOfProblems)
            
        case .classifying:
            self.createClassifyingGame(numberOfProblems)
        }
    }
    
    private mutating func createCountingGame(_ numberOfProblems: Int, _ highestNumberOfItems: Int) {
        for _ in 0..<numberOfProblems {
            let randomEmoji = emojisDictionary.randomElement()!
            let count = Int.random(in: 1...highestNumberOfItems)
            problems.append(CountingProblem(content: randomEmoji.key, contentCount: count, contentName: randomEmoji.value))
        }
    }
    
    private mutating func createIdentifyingColorGame() {
        for (color, name) in colorWithNames {
            problems.append(IdentifyingColorProblem(color: color, colorName: name))
        }
    }
    
    private mutating func createIdentifyingShapeGame() {
        for (shape, name) in shapeWithNames {
            problems.append(IdentifyingShapeProblem(shapeEmoji: shape, shape: name))
        }
    }
    
    private mutating func createComparingGame(_ numberOfProblems: Int, _ highestNumberOfItems: Int) {
        for _ in 0..<numberOfProblems {
            
            var array = Array(1...highestNumberOfItems)
            
            let firstSetCount = array.remove(at: Int.random(in: 0..<highestNumberOfItems))
            let secondSetCount = array.randomElement() ?? 0
            
            let firstRandomEmoji = emojisDictionary.keys.randomElement()!
            let secondRandomEmoji = emojisDictionary.keys.randomElement()!
            
            problems.append(ComparingProblem(firstSetCount: firstSetCount, secondSetCount: secondSetCount, firstSetEmoji: firstRandomEmoji, secondSetEmoji: secondRandomEmoji))

        }
    }
    
    private mutating func createPositionGame(_ numberOfProblems: Int) {
        for _ in 0..<numberOfProblems {
            problems.append(PositionProblem())
        }
    }
    
    private mutating func createClassifyingGame(_ numberOfProblems: Int) {
        for _ in 0..<numberOfProblems {
            problems.append(ClassifyingProblem())
        }
    }
    
    
    // MARK: CONSTANTS
    private let emojisDictionary = ["🐶": "dogs", "🐰": "bunnies", "🐻": "bears", "🦁": "lions", "🐵": "monkeys", "🦉": "owls", "🐢": "turtle", "🐬": "dolphins", "🦒": "giraffes", "🐑": "sheeps", "🐿": "squirrels", "🐓": "chickens", "🐫": "camels"]
    
    private let colorWithNames: [UIColor: String] = [.red: "Red", .black: "Black", .purple: "Purple", .green: "Green", .orange: "Orange", .systemPink: "Pink", .gray: "Gray", .yellow: "Yellow", .brown: "Brown", .magenta: "Magenta", .systemTeal: "Teal"]
    
    
    private let shapeWithNames = ["🔴": "Circle", "🚫": "Circle", "⚪️": "Circle", "💿": "Circle", "⬜️": "Square", "🔳": "Square", "🖼": "Square", "🚺": "Square","📐": "Triangle", "⚠️": "Triangle", "🔺": "Triangle", "💳": "Rectangle", "🧰": "Rectangle" ]
}


extension Game {
    
    private func answerCorrect(_ answer: String) -> Bool {
        problems[index].rightAnswer == answer
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
        
        if index < problems.count - 1 {
            index += 1
        }
            
        else {
            gameCompleted = true
        }
    }
}
