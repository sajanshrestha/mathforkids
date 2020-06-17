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
    
    private let numberOfProblems = 5
    
    init(highestNumberOfItems: Int, gameType: KinderGartenGameList.GameType) {
                
        switch gameType {
            
        case .counting:
            self.createCountingGame(highestNumberOfItems)
            
        case .identifyingColor:
            self.createIdentifyingColorGame()
            
        case .identifyingShape:
            self.createIdentifyingShapeGame()
             
        case .comparing:
            self.createComparingGame(highestNumberOfItems)
            
        case .position:
            self.createPositionGame()
            
        case .classifying:
            self.createClassifyingGame()
        }
    }
    
    private mutating func createCountingGame(_ highestNumberOfItems: Int) {
        
        for _ in 0..<numberOfProblems {
            let randomEmoji = emojisDictionary.randomElement()!
            let count = Int.random(in: 1...highestNumberOfItems)
            problems.append(CountingProblem(emoji: randomEmoji.key, emojiCount: count, emojiName: randomEmoji.value))
        }
    }
    
    private mutating func createIdentifyingColorGame() {
        
        let colors = colorWithNames.randomElements(numberOfProblems)
        
        for (color, name) in colors {
            problems.append(IdentifyingColorProblem(color: color, colorName: name))
        }
    }
    
    private mutating func createIdentifyingShapeGame() {
        
        let shapes = shapeWithNames.randomElements(numberOfProblems)
        
        for (shape, name) in shapes {
            problems.append(IdentifyingShapeProblem(shapeEmoji: shape, shape: name))
        }
    }
    
    private mutating func createComparingGame(_ highestNumberOfItems: Int) {
        for _ in 0..<numberOfProblems {
            
            let randomCounts = Array(1...highestNumberOfItems).randomElements(2)
            
            guard randomCounts.count == 2 else { return }
            
            let randomEmojis = emojisDictionary.randomElements(2)
            
            problems.append(ComparingProblem(firstSetCount: randomCounts[0], secondSetCount: randomCounts[1], firstSetEmoji: randomEmojis[0].key, secondSetEmoji: randomEmojis[1].key))

        }
    }
    
    private mutating func createPositionGame() {
        for _ in 0..<numberOfProblems {
            problems.append(PositionProblem())
        }
    }
    
    private mutating func createClassifyingGame() {
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
