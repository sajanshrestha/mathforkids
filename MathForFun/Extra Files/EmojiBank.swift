//
//  EmojiBank.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/21/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//


//"🐺": "Wolf",
//"🦩": "Flamingo",
//"🦋": "Butterfly",



import Foundation

struct EmojiBank {
    
    struct IdentifyingObjects {
        
        static var levelOneEmojis: [String: String] {
            EmojiBank.animalEmojis
        }
        
        static var levelTwoEmojis = [
            "🐞": "Ladybug",
            "🐜": "Ant",
            "🕷": "Spider",
            "🦉": "Owl",
            "🦆": "Duck",
            "🦜": "Parrot",
            "🦢": "Swan",
            "🐧": "Penguin",
            "🦅": "Eagle",
            "🦃": "Turkey",
            "🦚": "Peacock",
            "🐝": "Bee",
            "🐌": "Snail",
            "🦂": "Scorpion",
            "🦇": "Bat"
        ]
        
        
        static let levelThreeEmojis = [
                "🦀": "Crab",
        //        "🐡": "Blowfish",
                "🐬": "Dolphin",
                "🐳": "Whale",
                "🦈": "Shark",
                "🐊": "Crocodile",
                "🐢": "Turtle",
        //        "🐙": "Octopus",
                "🐧": "Penguin",
                "🦑": "Squid",
                "🦐": "Shrimp",
                "🦞": "Lobster"
            ]
        
        static var levelFourEmojis: [String: String] {
            
            var emojis = [String: String]()
            
            vehicleEmojis.forEach { emojis[$0.key] = $0.value }
            electronicsEmojis.forEach { emojis[$0.key] = $0.value }

            return emojis
        }
        
        static let levelFiveEmojis = [
            
            "🇦🇷": "flag of Argentina",
            "🇲🇽": "flag of Mexico",
            "🇨🇦": "flag of Canada",
            "🇧🇪": "flag of Belgium",
            "🇧🇹": "flag of Bhutan",
            "🇪🇬": "flag of Egypt",
            "🇫🇮": "flag of Finland",
            "🇬🇷": "flag of Greece",
            "🇮🇳": "flag of India",
            "🇯🇵": "flag of Japan",
            "🇰🇼": "flag of Kuwait",
            "🇱🇷": "flag of Liberia",
            "🇲🇦": "flag of Morocco",
            "🇺🇸": "flag of America",
            "🇺🇾": "flag of Uruguay",
            "🇩🇰": "flag of Denmark",
            "🇳🇵": "flag of Nepal"
        ]

        static let levelSixEmojis = [
            "❤️": "red heart",
            "💙":"blue heart",
            "☮️":"symbol of peace",
            "🕉":"om symbol",
            "☯️":"ying yang",
            "❌":"cross mark",
            "✅":"check mark",
            "🚺":"women's symbol",
            "🚹":"men's symbol",
            "🚼":"baby's symbol",
            "🎦":"cinema symbol",
            "♿️":"wheelchair symbol",
            "🚷":"no pedestrian symbol",
            "📵":"no mobile phones symbol",
        ]
        
        static let levelSevenEmojis = [
            "☢️": "symbol of radioactive",
            "⛔️":"no entry sign",
            "🚯":"no littering symbol",
            "🚸":"children crossing symbol",
            "♻️":"recycling symbol",
            "❌":"cross mark",
            "🇩🇿":"flag of Algeria",
            "🇧🇩":"flag of Bangladesh",
            "🇧🇬":"flag of Bulgaria",
            "🇫🇷":"flag of France",
            "💳":"credit card",
            "🔨":"hammer",
            "🔬":"microscope",
            "💊":"pill",
            "🧬":"DNA",
            "🦠":"microbe",
            "🧻":"roll of paper",
            "🔑":"key",
            "🚎":"trolleybus",
            "🚜":"tractor",
            "🎸":"guitar",
            "🥁":"drum",
            "🏆":"trophy",
            "🥟":"dumpling"
            
        ]
        
        
        static var emojis: [String: String] {
            
            var emojis = [String: String]()
            
            levelOneEmojis.forEach { emojis[$0.key] = $0.value }
            levelTwoEmojis.forEach { emojis[$0.key] = $0.value }
            levelThreeEmojis.forEach { emojis[$0.key] = $0.value }
            levelFourEmojis.forEach { emojis[$0.key] = $0.value }
            levelFiveEmojis.forEach { emojis[$0.key] = $0.value }
            levelSixEmojis.forEach { emojis[$0.key] = $0.value }

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
        "🦧": "Orangutan",
        "🐫": "Camel",
        "🦌": "Deer",
        "🦥": "Sloth",
        "🐁": "Mouse",
        "🐀": "Rat",
        "🦔": "Hedgehog",
        "🦦": "Otter"
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
    
    static let fastFoodEmojis = [
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
    
    static let electronicsEmojis = [
        "📱": "Phone",
        "💻": "Laptop",
        "🖥": "Screen",
        "🖨": "Printer",
        "🖲": "Computer Mouse",
        "💾": "Floppy Disk",
        "📀": "CD",
        "📷": "Camera",
        "☎️": "Telephone",
        "📻": "Radio"
    ]
    
    static let toolEmojis = [
        "🔨": "Hammer",
        "🪓": "Axe",
        "🔑": "Key",
        "📎": "Paper Clip",
        "📌": "Thumb Pin",
        "🔒": "Lock"
    ]
    
    static let sportsEmojis = [
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
        fastFoodEmojis.forEach { emojis[$0.key] = $0.value }


        return emojis
    }
   
    
    static var emojis: [String: String] {
        
        var emojis = [String: String]()
        
        foodEmojis.forEach { emojis[$0.key] = $0.value }
        vehicleEmojis.forEach { emojis[$0.key] = $0.value }
        electronicsEmojis.forEach { emojis[$0.key] = $0.value }
        toolEmojis.forEach { emojis[$0.key] = $0.value }
        sportsEmojis.forEach { emojis[$0.key] = $0.value }

        return emojis
        
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
