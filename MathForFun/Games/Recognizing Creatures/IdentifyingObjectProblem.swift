//
//  RecognizingAnimals.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 8/26/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

struct IdentifyingObjectProblem: Problem {
    
    struct Object: Identifiable {
        var name: String
        var emoji: String
        var id: String
    }
    
    var object: Object
    
    var rightAnswer: String { object.name }
    
    var options: [Object]
    
    var backgroundImageName: String
    
    var questionText: String {
        "Drag the \(rightAnswer) onto the picture!"
    }
    
    static func getProblems(count: Int, gameLevel: Int) -> [IdentifyingObjectProblem] {
        
        var problems = [IdentifyingObjectProblem]()
        
        for _ in 1...10 {
            
            let options = getOptions(for: gameLevel)
            let selectedOption = options.randomElement()!
            let backgroundImageName = getBackgroundImage(for: gameLevel)
            problems.append(IdentifyingObjectProblem(object: selectedOption, options: options, backgroundImageName: backgroundImageName))
        }
        
        return problems
    }
    
    private static func getOptions(for level: Int) -> [Object] {
       
        switch level {
        case 1:
            return levelOneObjects.randomElements(4)
        case 2:
            return levelTwoObjects.randomElements(4)
        case 3:
            return levelThreeObjects.randomElements(4)
        case 4:
            return levelFourObjects.randomElements(4)
        case 5:
            return levelFiveObjects.randomElements(4)
        case 6:
            return levelSixObjects.randomElements(4)
        default:
            return levelOneObjects.randomElements(4)
        }
    }
    
    private static func getBackgroundImage(for level: Int) -> String {
        "identifyingObject_\(level)"
    }
    
    private static var levelOneObjects = EmojiBank.IdentifyingObjects.levelOneEmojis.map { Object(name: $0.value.lowercased(), emoji: $0.key, id: $0.key) }
    
    private static var levelTwoObjects = EmojiBank.IdentifyingObjects.levelTwoEmojis.map { Object(name: $0.value.lowercased(), emoji: $0.key, id: $0.key) }
    
    private static var levelThreeObjects = EmojiBank.IdentifyingObjects.levelThreeEmojis.map { Object(name: $0.value.lowercased(), emoji: $0.key, id: $0.key) }
    
    private static var levelFourObjects = EmojiBank.IdentifyingObjects.levelFourEmojis.map {  Object(name: $0.value.lowercased(), emoji: $0.key, id: $0.key) }
    
    
    private static var levelFiveObjects = EmojiBank.IdentifyingObjects.levelFiveEmojis.map { Object(name: $0.value, emoji: $0.key, id: $0.key)}
    
    private static var levelSixObjects = EmojiBank.IdentifyingObjects.levelSixEmojis.map { Object(name: $0.value, emoji: $0.key, id: $0.key)}

}
