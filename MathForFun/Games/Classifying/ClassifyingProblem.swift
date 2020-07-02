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

    var numberOfSimilarItems = Int.random(in: 2...3)
    
    init(_ gameLevel: Int) {
        
        switch gameLevel {
            
        case 1:
            populateItemsForLevelOne()
        case 2:
            populateItemsForLevelTwo(with: levelTwoEmojiPool)
        case 3:
            populateItemsForLevelThree(with: levelThreeEmojiPool)
        case 4:
            populateItemsForLevelFour(with: levelFourEmojiPool)
        case 5:
            populateItemsForLevelFive(with: levelFiveEmojiPool)
        default:
            populateItemsForLevelThree(with: levelThreeEmojiPool)
        }
        
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
    
    struct Item: Identifiable {
        
        var id = UUID()
        var content: String
        var isUnique: Bool
        
    }
}

extension ClassifyingProblem {
    
    private mutating func populateItemsForLevelOne() {
        
        let emojis = Array(EmojiBank.emojis.keys)
        
        let randomEmojis = emojis.randomElements(2)
                
        items.append(Item(content: randomEmojis[0], isUnique: true))
        
        for _ in 0..<numberOfSimilarItems {
            items.append(Item(content: randomEmojis[1], isUnique: false))
        }
        
        items.shuffle()
    }
    
    private mutating func populateItemsForLevelTwo(with emojiPool: [[String: String]]) {
        
        populateItems(with: emojiPool)
        
    }
    
    private mutating func populateItemsForLevelThree(with emojiPool: [[String: String]]) {
        
        populateItems(with: emojiPool)

    }
    
    private mutating func populateItemsForLevelFour(with emojiPool: [[String: String]]) {
        
        populateItems(with: emojiPool)

    }
    
    private mutating func populateItemsForLevelFive(with emojiPool: [[String: String]]) {
        
        populateItems(with: emojiPool)

    }
    
    private mutating func populateItems(with emojiPool: [[String: String]]) {
        
        let randomIndex = Int.random(in: 0..<emojiPool.count - 1)
        
        let similarEmojis = emojiPool[randomIndex].randomElements(numberOfSimilarItems)
        
        for emoji in similarEmojis {
            items.append(Item(content: emoji.key, isUnique: false))
        }
        
        let remainingIndices = Array(0..<emojiPool.count).filter { $0 != randomIndex }
        
        var restOfEmojis = [[String: String]]()
        
        for index in remainingIndices {
            restOfEmojis.append(emojiPool[index])
        }
        
        items.append(Item(content: restOfEmojis.randomElement()!.randomElement()!.key, isUnique: true))
        
        items.shuffle()
    }
    
    // MARK: CONSTANTS
    
    private var levelTwoEmojiPool: [[String: String]] {
        [
            EmojiBank.animalEmojis,
            EmojiBank.foodEmojis,
            EmojiBank.vehicleEmojis
        ]
    }
    
    
    private var levelThreeEmojiPool: [[String: String]] {
        [
            EmojiBank.fastFood,
            EmojiBank.fruitEmojis,
            EmojiBank.vegetableEmojis
        ]
    }
    
    private var levelFourEmojiPool: [[String: String]] {
        [
            EmojiBank.tools,
            EmojiBank.electronics,
            EmojiBank.sports
        ]
    }
    
    private var levelFiveEmojiPool: [[String: String]] {
        [
            EmojiBank.animalEmojis,
            EmojiBank.foodEmojis,
            EmojiBank.vehicleEmojis,
            EmojiBank.fastFood,
            EmojiBank.fruitEmojis,
            EmojiBank.vegetableEmojis,
            EmojiBank.tools,
            EmojiBank.electronics,
            EmojiBank.sports
            
        ]
    }
    
    
}

