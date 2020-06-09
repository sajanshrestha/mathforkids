//
//  ClassifyingProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/8/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation


struct ClassifyingProblem: Problem {
    
    
    var items =  [Item]()
    
    init() {
        
        let emojis = Array(emojiDict.keys)
        
        let randomEmojis = emojis.randomElements(2)
        
        let randomNumber = Int.random(in: 2...3)
        
        items.append(Item(content: randomEmojis[0]))
        
        for _ in 0..<randomNumber {
            items.append(Item(content: randomEmojis[1]))
        }
        
        items.shuffle()
    }
    
    var rightAnswer: String {
        
        let contents = items.map { $0.content }
        
        var uniqueNames = Set(contents)
        
        let firstName = uniqueNames.removeFirst()
        let secondName = uniqueNames.removeFirst()

        let firstItemListCount = contents.filter { $0 == firstName}.count
        let secondItemListCount = contents.filter { $0 == secondName}.count
        
        return firstItemListCount < secondItemListCount ? firstName : secondName

    }
    
    var options: [String] {
        []
    }
    
    private let emojiDict =  ["🐶": "Dog", "🐰": "Bunny", "🐻": "Bear", "🦁": "Lion", "🐵": "Monkey", "🦉": "Owl", "🐢": "Turtle", "🐬": "Dolphin", "🦒": "Giraffe", "🐑": "Sheep", "🐿": "Squirrel", "🐓": "Chicken", "🐫": "Camel", "🦍": "Gorilla", "🦘": "Kangaroo", "🌻": "Sunflower", "🌈": "Rainbow", "🍎": "Apple", "🥦": "Brocolli", "🥨": "Pretzel", "🍔": "Burger", "🍕": "Pizza", "🍩": "Donut", "🏀": "Basket Ball", "🚗": "Car", "🚌": "Bus", "✈️": "Airplane", "🏠": "House", "🧸": "Teddy Bear"]
    
    struct Item: Identifiable {
        var id = UUID()
        var content: String
    }
    
}
