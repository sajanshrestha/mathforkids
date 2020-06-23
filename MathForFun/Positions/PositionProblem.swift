//
//  PositionProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/7/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//


import Foundation

struct PositionProblem: Problem {
    
    var orientation: Orientation
    
    private var firstElement: Element
    private var secondElement: Element
    private var thirdElement: Element
    
    private var elementChosen: Element

    init() {
        
        self.orientation = [Orientation.vertical, Orientation.horizontal].randomElement()!
        
        let emojiList = Array(EmojiBank.emojis)
        
        let randomEmojis = emojiList.randomElements(3)
        
        let first = randomEmojis[0]
        let second = randomEmojis[1]
        let third = randomEmojis[2]

        
        switch orientation {
            
        case .horizontal:
            firstElement = Element(content: first.key, name: first.value, position: .left)
            secondElement = Element(content: second.key, name: second.value, position: .middle)
            thirdElement = Element(content: third.key, name: third.value, position: .right)
            
        case .vertical:
            firstElement = Element(content: first.key, name: first.value, position: .top)
            secondElement = Element(content: second.key, name: second.value, position: .middle)
            thirdElement = Element(content: third.key, name: third.value, position: .bottom)
        }
        
        elementChosen = [firstElement, secondElement, thirdElement].randomElement()!
        
    }
    
    var questionText: String {
        let prepositionInTheQuestion = preposition(for: elementChosen.position)
        return "What is \(prepositionInTheQuestion) the \(elementChosen.position.rawValue)?"
    }
    
    private func preposition(for position: Position) -> String {
        switch position {
        case .bottom, .top:
            return "at"
        case .left, .right:
            return "on"
        case .middle:
            return "in"
        }
    }
    
    
    var contents: [String] {
        [firstElement, secondElement, thirdElement].map {$0.content}
    }
        
    var rightAnswer: String {
        elementChosen.name
    }
    
    var options: [String] {
        [firstElement, secondElement, thirdElement].map {$0.name}.shuffled()
    }
    
    enum Orientation {
        case vertical
        case horizontal
    }
    
    enum Position: String { case left, right, middle, top, bottom }
    
    struct Element {
        let content: String
        let name: String
        let position: Position
    }
    
    static func getProblems(count: Int) -> [PositionProblem] {
        
        var problems = [PositionProblem]()
        
        for _ in 0..<count {
            problems.append(PositionProblem())
        }
        
        return problems
    }
    
}
