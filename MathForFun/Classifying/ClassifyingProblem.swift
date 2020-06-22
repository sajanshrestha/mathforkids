//
//  ClassifyingProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/8/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation


struct ClassifyingProblem: Problem {
    
    struct Item: Identifiable {
        
        var id = UUID()
        var content: String
        var isUnique: Bool
        
    }
    
    
    var items =  [Item]()
    
    init(_ gameLevel: Int) {
        
        if gameLevel == 1 {
            createLevelOneGame()
        }
        
        else if gameLevel == 2 {
            createLevelTwoGame()
        }
        
        else if gameLevel == 3 {
            createLevelThreeGame()
        }
        else if gameLevel == 4 {
            createLevelFourGame()
        }
        
    }
    
    private mutating func createLevelOneGame() {
        
        let emojis = Array(EmojiBank.emojis.keys)
        
        let randomEmojis = emojis.randomElements(2)
        
        let randomNumber = Int.random(in: 2...3)
        
        items.append(Item(content: randomEmojis[0], isUnique: true))
        
        for _ in 0..<randomNumber {
            items.append(Item(content: randomEmojis[1], isUnique: false))
        }
        
        items.shuffle()
    }
    
    private mutating func createLevelTwoGame() {
        
        items.append(Item(content: EmojiBank.nonAnimalEmojis.randomElement()!.key, isUnique: true))
        
        let randomAnimalEmojis = EmojiBank.animalEmojis.randomElements(Int.random(in: 2...3))
        
        for emoji in randomAnimalEmojis {
            items.append(Item(content: emoji.key, isUnique: false))
        }
        
        items.shuffle()

    }
    
    private mutating func createLevelThreeGame() {
        
        items.append(Item(content: EmojiBank.nonFoodEmojis.randomElement()!.key, isUnique: true))
        
        let randomFoodEmojis = EmojiBank.foodEmojis.randomElements(Int.random(in: 2...3))
        
        for emoji in randomFoodEmojis {
            items.append(Item(content: emoji.key, isUnique: false))
        }
        
        items.shuffle()

    }
    
    private mutating func createLevelFourGame() {
        
        items.append(Item(content: EmojiBank.nonVehicleEmojis.randomElement()!.key, isUnique: true))
        
        let randomVehicleEmojis = EmojiBank.vehicleEmojis.randomElements(Int.random(in: 2...3))
        
        for emoji in randomVehicleEmojis {
            items.append(Item(content: emoji.key, isUnique: false))
        }
        
        items.shuffle()

    }
    
    var rightAnswer: String {
        
        let contents = items.filter { $0.isUnique == true}
        
        return contents.first?.content ?? ""
        
    }
    
    var options: [String] {
        []
    }
    
    static func getProblems(count: Int, gameLevel: Int) -> [ClassifyingProblem] {
        
        var problems = [ClassifyingProblem]()
        
        for _ in 0..<count {
            problems.append(ClassifyingProblem(gameLevel))
        }
        
        return problems
    }
}

