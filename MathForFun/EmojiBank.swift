//
//  EmojiBank.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/21/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

struct EmojiBank {
    
    static let animalEmojis = [
        "🐶": "Dog",
        "🐻": "Bear",
        "🦁": "Lion",
        "🦍": "Gorilla",
        "🐢": "Turtle",
        "🦒": "Giraffe",
        "🦓": "Zebra",
        "🐄": "Cow",
        "🐈": "Cat",
        "🐅": "Tiger",
        "🐸": "Frog",
        "🐿": "Squirrel"
    ]
    
    static let fruitEmojis = [
        "🍎": "Apple",
        "🍐": "Pear",
        "🍌": "Banana",
        "🍉": "Watermelon",
        "🍇": "Grape",
        "🍓": "Strawberry",
        "🍒": "Cherry",
        "🍑": "Peach",
        "🍍": "Pineapple",
        "🥝": "Kiwi"
    ]
    
    static let vegetableEmojis = [
        "🥦": "Brocolli",
        "🥬": "KalLe",
        "🥒": "Cucumber",
        "🥕": "Carrot",
        "🧅": "Onion",
        "🌶": "Chilli",
        "🌽": "Corn",
        "🍅": "Tomato",
        "🥔": "Potato"
    ]
    
    static let fastFood = [
        "🌭": "Hot Dog",
        "🍔": "Burger",
        "🍟": "Fries",
        "🍕": "Pizza",
        "🥪": "Sanwich",
        "🌮": "Taco",
        "🌯": "Burrito"
    ]
    
    static let vehicleEmojis = [
        "🚖": "Taxi",
        "🚗": "Car",
        "🚁": "Helicopter",
        "🚑": "Ambulance",
        "🚓": "Police Car",
        "✈️": "Plane",
        "🚲": "Bicycle",
        "🚢": "Ship",
        "🚊": "Train",
        "🏍": "Motorcycle",
        "🛵": "Scooter"
    ]
    
    static let electronics = [
        "📱": "Phone",
        "💻": "Laptop",
        "🖥": "Screen",
        "🖨": "Printer",
        "🖲": "Mouse",
        "💾": "Floppy Disk",
        "📀": "CD",
        "📷": "Camera",
        "☎️": "Telephone",
        "📻": "Radio"
    ]
    
    static let tools = [
        "🔨": "Hammer",
        "🪓": "Axe",
        "🔑": "Key",
        "📎": "Paper Clip",
        "📌": "Thumb Pin",
        "🔒": "Lock"
    ]
    
    static let sports = [
        "⚽️": "Soocer Ball",
        "🏀": "Basket Ball",
        "🏈": "Football",
        "⚾️": "Baseball",
        "🎾": "Tennis Ball",
        "🏐": "Volley Ball",
        "🏏": "Cricket"
    ]
    
    static var foodEmojis: [String: String] {
        
        var emojis = [String: String]()
        
        fruitEmojis.forEach { emojis[$0.key] = $0.value }
        vegetableEmojis.forEach { emojis[$0.key] = $0.value }
        fastFood.forEach { emojis[$0.key] = $0.value }


        return emojis
    }
   
    
    static var emojis: [String: String] {
        
        var emojis = [String: String]()
        
        foodEmojis.forEach { emojis[$0.key] = $0.value }
        animalEmojis.forEach { emojis[$0.key] = $0.value }
        vehicleEmojis.forEach { emojis[$0.key] = $0.value }

        return emojis
        
    }
     
}
