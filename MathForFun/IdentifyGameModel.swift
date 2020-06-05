//
//  IdentifyGameModel.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import UIKit

class IdentifyingColorGameModel: ObservableObject {
    
    @Published private var game: IdentifyingColorGame = IdentifyingColorGame()
    
    var colors: [IdentifyingColorGame.Color] {
        game.colors
    }
    
    var index: Int {
        game.index
    }
    
    var score: Int {
        game.score
    }
    
    var gameOver: Bool {
        game.gameOver
    }
    
    func submitAnswer(answer: String) -> Bool {
        game.submitAnswer(answer)
    }
    
}


struct IdentifyingColorGame {
    
    var colors: [Color]
    
    var index = 0
    
    var score = 0
    
    var gameOver = false
    
    init() {
        
        colors = [Color]()
        
        let colorList: [UIColor] = [.red, .black, .green, .yellow, .brown, .cyan, .gray, .purple, .red, .systemPink]
        
        for color in colorList {
            colors.append(Color(name: color.description, color: color))
        }
        
    }
    
    mutating func submitAnswer(_ answer: String) -> Bool {
        if colors[index].name == answer {
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
        
        if index < colors.count - 1 {
            index += 1
        }
            
        else {
            print("Score is \(score)")
            gameOver = true
        }
    }
    
    struct Color {
        
        var name: String
        var color: UIColor
        
        // MARK: FIX THIS
        var options: [String] {
            
            var options = [String]()
            
            options.append("Red")
            options.append("Green")
            options.append("Blue")
            options.append("Yellow")

            return options
        }
    }
    
}


