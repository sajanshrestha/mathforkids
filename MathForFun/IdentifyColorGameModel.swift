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
        
        let colorWithNames: [UIColor: String] = [
            .red: "Red",
            .black: "Black",
            .purple: "Purple",
            .green: "Green",
            .orange: "Orange",
            .systemPink: "Pink",
            .gray: "Gray"
        ]
        
        for (color, name) in colorWithNames {
            colors.append(Color(name: name, color: color))
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

        var options: [String] {
            
            var options = [String]()
                    
            var colorNames = ["Red", "Green", "Yello", "Blue", "Pink", "Black"]
            
            options.append(name)
            
            colorNames.removeAll { $0 == name }
            
            for _ in 0..<3 {
                options.append(colorNames.remove(at: Int.random(in: 0..<colorNames.count)))
            }
            
            options.shuffle()

            return options
        }
    }
    
}


