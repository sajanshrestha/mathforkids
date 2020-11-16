//
//  ComparingAttributesProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 11/14/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

struct ComparingAttributesProblem: Problem {
    
    var isObject: Bool = false
    
    var rightAnswer: String {
        "superior"
    }
    
    lazy var questionText = isObject ? "Which one is \(attributePair.name)?" : "Who is \(attributePair.name)?"
    
    var attributePair: AttributePair
    
    static func getProblems(count: Int, gameLevel: Int) -> [ComparingAttributesProblem] {
        switch gameLevel {
        case 5:
            return fourthLevelAttributePairs.map { ComparingAttributesProblem(attributePair: $0) }
        case 6:
            return fifthLevelAttributePairs.map { ComparingAttributesProblem(isObject: true, attributePair: $0) }
        default:
            return sixthLevelAttributePairs.map { ComparingAttributesProblem(attributePair: $0) }
        }
    }
    
    struct AttributePair {
        var name: String
        var attributes: [Attribute]
        
        struct Attribute {
            var image: String
            var type: Superiority
        }
        
        enum Superiority: String {
            case superior
            case inferior
        }
    }
    
    static private let fourthLevelAttributePairs = [
        
        AttributePair(name: "faster", attributes: [AttributePair.Attribute(image: "carrot_eating_rabbit", type: .superior), AttributePair.Attribute(image: "slow_turtle", type: .inferior)].shuffled()),
        AttributePair(name: "more playful", attributes: [AttributePair.Attribute(image: "dancing_monkey", type: .superior), AttributePair.Attribute(image: "hanging_sloth", type: .inferior)].shuffled()),
        AttributePair(name: "taller", attributes: [AttributePair.Attribute(image: "giraffe", type: .superior), AttributePair.Attribute(image: "short_girl", type: .inferior)].shuffled()),
        AttributePair(name: "older", attributes: [AttributePair.Attribute(image: "old_man", type: .superior), AttributePair.Attribute(image: "pacifier_baby", type: .inferior)].shuffled()),
        AttributePair(name: "bigger", attributes: [AttributePair.Attribute(image: "baby_elephant", type: .superior), AttributePair.Attribute(image: "tiny_bee", type: .inferior)].shuffled()),
        AttributePair(name: "a better swimmer", attributes: [AttributePair.Attribute(image: "swimming_fish", type: .superior), AttributePair.Attribute(image: "brown_bear", type: .inferior)].shuffled()),
        AttributePair(name: "bigger", attributes: [AttributePair.Attribute(image: "big_tiger", type: .superior), AttributePair.Attribute(image: "smiling_cat", type: .inferior)].shuffled()),
        AttributePair(name: "taller", attributes: [AttributePair.Attribute(image: "ostrich", type: .superior), AttributePair.Attribute(image: "sparrow", type: .inferior)].shuffled()),
        AttributePair(name: "friendlier", attributes: [AttributePair.Attribute(image: "laughing_dog", type: .superior), AttributePair.Attribute(image: "honey_badger", type: .inferior)].shuffled()),
        AttributePair(name: "a better swimmer", attributes: [AttributePair.Attribute(image: "swimming_fish", type: .superior), AttributePair.Attribute(image: "brown_bear", type: .inferior)].shuffled()),
    ]
    
    static private let fifthLevelAttributePairs = [
        
        AttributePair(name: "hotter", attributes: [AttributePair.Attribute(image: "fire", type: .superior), AttributePair.Attribute(image: "ice", type: .inferior)].shuffled()),
        AttributePair(name: "heavier", attributes: [AttributePair.Attribute(image: "heavy_truck", type: .superior), AttributePair.Attribute(image: "bike", type: .inferior)].shuffled()),
        AttributePair(name: "hotter", attributes: [AttributePair.Attribute(image: "cold_icecream", type: .inferior), AttributePair.Attribute(image: "tea", type: .superior)].shuffled()),
        AttributePair(name: "more expensive", attributes: [AttributePair.Attribute(image: "diamond", type: .superior), AttributePair.Attribute(image: "chocolate_bar", type: .inferior)].shuffled()),
        AttributePair(name: "taller", attributes: [AttributePair.Attribute(image: "house", type: .inferior), AttributePair.Attribute(image: "skyscraper", type: .superior)].shuffled()),
        AttributePair(name: "longer", attributes: [AttributePair.Attribute(image: "hockey_stick", type: .superior), AttributePair.Attribute(image: "fork", type: .inferior)].shuffled()),
        AttributePair(name: "bigger", attributes: [AttributePair.Attribute(image: "statue_of_liberty", type: .superior), AttributePair.Attribute(image: "yellow_bus", type: .inferior)].shuffled()),
        AttributePair(name: "brighter", attributes: [AttributePair.Attribute(image: "sun", type: .superior), AttributePair.Attribute(image: "flash_light", type: .inferior)].shuffled()),
        AttributePair(name: "sharper", attributes: [AttributePair.Attribute(image: "knife", type: .superior), AttributePair.Attribute(image: "pencil", type: .inferior)].shuffled()),
        AttributePair(name: "hotter", attributes: [AttributePair.Attribute(image: "pepper", type: .superior), AttributePair.Attribute(image: "cheese", type: .inferior)].shuffled())
    ]
    
    static private let sixthLevelAttributePairs = [
        
        AttributePair(name: "heavier", attributes: [AttributePair.Attribute(image: "whale", type: .superior), AttributePair.Attribute(image: "baby_elephant", type: .inferior)].shuffled()),
        AttributePair(name: "bigger", attributes: [AttributePair.Attribute(image: "big_tiger", type: .superior), AttributePair.Attribute(image: "leopard", type: .inferior)].shuffled()),
        AttributePair(name: "slower", attributes: [AttributePair.Attribute(image: "baby_elephant", type: .superior), AttributePair.Attribute(image: "horse", type: .inferior)].shuffled()),
        AttributePair(name: "faster", attributes: [AttributePair.Attribute(image: "ostrich", type: .superior), AttributePair.Attribute(image: "old_man", type: .inferior)].shuffled()),
        AttributePair(name: "stronger", attributes: [AttributePair.Attribute(image: "strong_lion", type: .superior), AttributePair.Attribute(image: "leopard", type: .inferior)].shuffled()),
        AttributePair(name: "longer", attributes: [AttributePair.Attribute(image: "snake", type: .superior), AttributePair.Attribute(image: "worm", type: .inferior)].shuffled()),
        AttributePair(name: "dirtier", attributes: [AttributePair.Attribute(image: "pig", type: .superior), AttributePair.Attribute(image: "smiling_cat", type: .inferior)].shuffled()),
        AttributePair(name: "smarter", attributes: [AttributePair.Attribute(image: "dolphin", type: .superior), AttributePair.Attribute(image: "swimming_fish", type: .inferior)].shuffled()),
        AttributePair(name: "friendlier", attributes: [AttributePair.Attribute(image: "laughing_dog", type: .superior), AttributePair.Attribute(image: "zebra", type: .inferior)].shuffled()),
        AttributePair(name: "smaller", attributes: [AttributePair.Attribute(image: "pig", type: .superior), AttributePair.Attribute(image: "baby_elephant", type: .inferior)].shuffled())
    ]
}
