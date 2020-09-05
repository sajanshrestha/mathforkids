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
        "🐿": "Squirrel",
        "🐒": "Monkey",
        "🐗": "Boar",
        "🐺": "Wolf",
        "🦧": "Orangutan",
        "🦏": "Rhinoceros",
        "🐫": "Camel",
        "🦌": "Deer",
        "🦥": "Sloth",
        "🐁": "Mouse",
        "🐀": "Rat",
        "🦔": "Hedgehog",
        "🦦": "Otter"
    ]
    
    static let insectsEmojisAndBirdsEmojis = [
        "🐞": "Ladybug",
        "🐜": "Ant",
        "🕷": "Spider",
        "🦉": "Owl",
        "🦆": "Duck",
        "🦜": "Parrot",
        "🦢": "Swan",
        "🦩": "Flamingo",
        "🐧": "Penguin",
        "🦅": "Eagle",
        "🦃": "Turkey",
        "🦚": "Peacock",
        "🐝": "Bee",
        "🦋": "Butterfly",
        "🐌": "Snail",
        "🦂": "Scorpion",
        "🦇": "Bat"
    ]
    
    static let aquaticAnimalEmojis = [
        "🦀": "Crab",
        "🐡": "Blowfish",
        "🐬": "Dolphin",
        "🐳": "Whale",
        "🦈": "Shark",
        "🐊": "Crocodile",
        "🐢": "Turtle",
        "🐙": "Octopus",
        "🐧": "Penguin",
        "🦑": "Squid",
        "🦐": "Shrimp",
        "🦞": "Lobster"
    ]
    
    
    static let fruitEmojis = [
        "🍎": "Apple",
        "🍐": "Pear",
        "🍌": "Banana",
        "🍉": "Watermelon",
        "🍇": "Grape",
        "🍍": "Pineapple",
        "🥝": "Kiwi"
    ]
    
    static let vegetableEmojis = [
        "🥦": "Brocolli",
        "🥬": "Kale",
        "🥒": "Cucumber",
        "🥕": "Carrot",
        "🧅": "Onion",
        "🌶": "Chilli",
        "🌽": "Corn"
        //"🍅": "Tomato",
        //"🥔": "Potato"
    ]
    
    static let fastFood = [
        "🌭": "Hot Dog",
        "🍔": "Burger",
        "🍕": "Pizza",
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
    
    static var dailyObjects: [String: String] {
        
        var emojis = [String: String]()
        
        vehicleEmojis.forEach { emojis[$0.key] = $0.value }
        electronics.forEach { emojis[$0.key] = $0.value }

        return emojis
    }
    
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
        insectsEmojisAndBirdsEmojis.forEach { emojis[$0.key] = $0.value }
        aquaticAnimalEmojis.forEach { emojis[$0.key] = $0.value }


        return emojis
        
    }
    
    static func key(for value: String) -> String? {
        for (k, v) in emojis {
            if value.lowercased() == v.lowercased() {
                return k
            }
        }
        return nil
    }
     
}


struct AlphabetBank {
    
    static var alphabets: [String: String] {
        var result = [String: String]()
        let alphas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".compactMap { String($0) }
        alphas.forEach {
            result[$0] = $0
        }
        return result
    }
        
}


struct NumberBank {
    
    static var numbers: [String: String] {
        var result = [String: String]()
        let alphas = (0...9).compactMap { String($0) }
        alphas.forEach {
            result[$0] = $0
        }
        return result
    }
        
}
