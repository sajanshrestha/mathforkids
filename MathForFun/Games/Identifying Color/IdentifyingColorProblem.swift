//
//  IdentifyingColorProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/6/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import UIKit


struct IdentifyingColorProblem: Problem {
    
    var color: UIColor
    var colorName: String
    
    var rightAnswer: String { colorName }
    
    var options: [String] {
        
        var options = [String]()
        
        var colorNames = ["Red", "Green", "Yellow", "Blue", "Pink", "Black", "Magenta", "Yale", "Ruby", "Olympic", "Forest Green", "Gold", "Orchid", "Sky Blue", "Maroon", "Coral", "Papaya Whip",]
        
        options.append(colorName)
        
        colorNames.removeAll { $0 == colorName }
        
        options.append(contentsOf: colorNames.randomElements(3))
        
        options.shuffle()
        
        return options
        
    }
    
    static func getProblems(count: Int, level: Int) -> [IdentifyingColorProblem] {
        
        var problems = [IdentifyingColorProblem]()
        
        let colors = getColors(count: count, for: level)
        
        for (color, name) in colors {
            
            problems.append(IdentifyingColorProblem(color: color, colorName: name))
        }
        
        return problems
        
    }
    
    private static func getColors(count: Int, for level: Int) -> [(key: UIColor, value: String)] {
        switch level {
        case 1:
            return levelOneColors.randomElements(count)
        case 2:
            return levelTwoColors.randomElements(count)
        case 3:
            return levelThreeColors.randomElements(count)
        default:
            return levelThreeColors.randomElements(count)
            
        }
    }
    
    private static let levelOneColors: [UIColor: String] = [
        .red: "Red",
        .black: "Black",
        .purple: "Purple",
        .green: "Green",
        .orange: "Orange",
        .systemPink: "Pink",
        .gray: "Gray",
        .yellow: "Yellow",
        .brown: "Brown",
        .magenta: "Magenta",
        .systemTeal: "Teal"]
    
    private static let levelTwoColors: [UIColor: String] = [
        #colorLiteral(red: 0.9817011952, green: 0.5050411224, blue: 0.4410601556, alpha: 1): "Salmon",
        #colorLiteral(red: 0.7839210629, green: 0.117426835, blue: 0.2238128781, alpha: 1) : "Raspberry",
        #colorLiteral(red: 0.8778958917, green: 0.07078518718, blue: 0.3718247414, alpha: 1) : "Ruby",
        #colorLiteral(red: 0.05504552275, green: 0.296012789, blue: 0.58018291, alpha: 1) : "Yale",
        #colorLiteral(red: 0.004340742715, green: 0.552775085, blue: 0.8012948036, alpha: 1): "Olympic",
        .red: "Red",
        .black: "Black",
        .purple: "Purple",
        .green: "Green",
        .orange: "Orange"]
    
    private static let levelThreeColors: [UIColor: String] = [
        #colorLiteral(red: 0.132835716, green: 0.5445541739, blue: 0.1309993863, alpha: 1): "Forest Green",
        #colorLiteral(red: 0.9983648658, green: 0.8427359462, blue: 0.004084086511, alpha: 1): "Gold",
        #colorLiteral(red: 0.8541101813, green: 0.4403198957, blue: 0.8401323557, alpha: 1): "Orchid",
        #colorLiteral(red: 0.5264858603, green: 0.8094966412, blue: 0.9223278165, alpha: 1): "Sky Blue",
        #colorLiteral(red: 0.5024918318, green: 0, blue: 0, alpha: 1): "Maroon",
        #colorLiteral(red: 0.9995726943, green: 0.4961493015, blue: 0.3119888604, alpha: 1): "Coral",
        #colorLiteral(red: 1, green: 0.9363560081, blue: 0.8359717131, alpha: 1): "Papaya Whip",
        #colorLiteral(red: 0.9817011952, green: 0.5050411224, blue: 0.4410601556, alpha: 1): "Salmon",
        #colorLiteral(red: 0.8778958917, green: 0.07078518718, blue: 0.3718247414, alpha: 1): "Ruby",
        #colorLiteral(red: 0.05504552275, green: 0.296012789, blue: 0.58018291, alpha: 1) : "Yale"
    ]
    
}

