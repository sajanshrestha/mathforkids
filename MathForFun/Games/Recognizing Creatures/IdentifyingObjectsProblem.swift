//
//  RecognizingAnimals.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 8/26/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

struct IdentifyingObjectsProblem: Problem {
    
    struct Creature: Identifiable {
        var name: String
        var emoji: String
        var id = UUID()
    }
    
    var creature: Creature
    
    var rightAnswer: String { creature.name }
    
    var creatures: [Creature]
    
    var backgroundImageName: String
    
    var questionText: String {
        "Drag the \(rightAnswer) onto the picture!"
    }
    
    static func getProblems(count: Int, gameLevel: Int) -> [IdentifyingObjectsProblem] {
        
        var problems = [IdentifyingObjectsProblem]()
        
        for _ in 1...10 {
            let options = getOptions(for: gameLevel)
            let selectedOption = options.randomElement()!
            problems.append(IdentifyingObjectsProblem(creature: selectedOption, creatures: options, backgroundImageName: getBackgroundImage(for: gameLevel)))
        }
        
        return problems
    }
    
    private static func creature(for level: Int) -> Creature {
        getOptions(for: level).randomElement()!
    }
    
    private static func getOptions(for level: Int) -> [Creature] {
       
        switch level {
        case 1:
            return levelOneObjects.randomElements(4)
        case 2:
            return levelTwoObjects.randomElements(4)
        case 3:
            return levelThreeObjects.randomElements(4)
        case 4:
            return levelFourObjects.randomElements(4)
        default:
            return levelOneObjects.randomElements(4)
        }
    }
    
    private static func getBackgroundImage(for level: Int) -> String {
        "habitat_\(level)"
    }
    
    private static var levelOneObjects = EmojiBank.animalEmojis.map { Creature(name: $0.value.lowercased(), emoji: $0.key) }
    
    private static var levelTwoObjects = EmojiBank.insectsEmojisAndBirdsEmojis.map { Creature(name: $0.value.lowercased(), emoji: $0.key) }
    
    private static var levelThreeObjects = EmojiBank.aquaticAnimalEmojis.map { Creature(name: $0.value.lowercased(), emoji: $0.key) }
    
    private static var levelFourObjects = EmojiBank.dailyObjects.map {  Creature(name: $0.value.lowercased(), emoji: $0.key) }
}



