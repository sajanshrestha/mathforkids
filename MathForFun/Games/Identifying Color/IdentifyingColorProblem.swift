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
        
        var colorNames = ["Red", "Green", "Yellow", "Blue", "Pink", "Black", "Magenta", "Yale", "Ruby", "Olympic", "Forest Green", "Gold", "Orchid", "Sky Blue", "Maroon", "Coral", "Papaya Whip"]
        
        options.append(colorName)
        
        colorNames.removeAll { $0 == colorName }
        
        options.append(contentsOf: colorNames.randomElements(3))
        
        options.shuffle()
        
        return options
        
    }
    
    static func getProblems(count: Int, level: Int) -> [IdentifyingColorProblem] {
        
        var problems = [IdentifyingColorProblem]()
        
        let colors = getColors(for: level)
        
        for color in colors {
            
            problems.append(IdentifyingColorProblem(color: color.UIColor, colorName: color))
        }
        
        return problems
        
    }
    
    private static func getColors(for level: Int) -> [String] {
        switch level {
        case 1:
            return levelOneColorNames
        case 2:
            return levelTwoColorNames
        case 3:
            return levelThreeColorNames
        case 4:
            return levelFourColorNames
        case 5:
            return levelFiveColorNames
        default:
            return levelFiveColorNames
            
        }
    }
    
    
    private static var levelOneColorNames = ["Red", "Green", "Yellow", "Blue", "Black", "Red", "Green", "Yellow", "Blue", "Black"]
    
    private static var levelTwoColorNames = ["Purple", "Red", "Orange", "Gray", "Yellow", "Blue", "Brown", "Black", "Green", "Purple"]
    
    private static var levelThreeColorNames = ["Blue", "Purple", "Red", "Ruby", "Maroon", "Teal", "Brown", "Gold", "Green", "Purple"]
    
    private static var levelFourColorNames = ["Salmon", "Raspberry", "Black", "Green", "Orchid", "Salmon", "Pink", "Coral", "Brown", "Ruby"]
    
    private static var levelFiveColorNames = ["Salmon", "Raspberry", "Papaya Whip", "Gold", "Orchid", "Yellow", "Pink", "Coral", "Brown", "Ruby"]
    
    
}


extension String {
    var UIColor: UIColor {
        switch self {
        case "Red": return .red
        case "Blue": return .blue
        case "Yellow": return .yellow
        case "Black": return .black
        case "Purple": return .purple
        case "Orange": return .orange
        case "Gray": return .gray
        case "Brown": return .brown
        case "Pink": return .systemPink
        case "Teal": return .systemTeal
        case "Magenta": return .magenta
        case "Forest Green": return #colorLiteral(red: 0.132835716, green: 0.5445541739, blue: 0.1309993863, alpha: 1)
        case "Gold": return #colorLiteral(red: 0.9983648658, green: 0.8427359462, blue: 0.004084086511, alpha: 1)
        case "Orchid": return #colorLiteral(red: 0.8541101813, green: 0.4403198957, blue: 0.8401323557, alpha: 1)
        case "Sky Blue": return #colorLiteral(red: 0.5264858603, green: 0.8094966412, blue: 0.9223278165, alpha: 1)
        case "Maroon": return #colorLiteral(red: 0.5024918318, green: 0, blue: 0, alpha: 1)
        case "Coral": return #colorLiteral(red: 0.9995726943, green: 0.4961493015, blue: 0.3119888604, alpha: 1)
        case "Papaya Whip": return #colorLiteral(red: 1, green: 0.9363560081, blue: 0.8359717131, alpha: 1)
        case "Salmon": return #colorLiteral(red: 0.9817011952, green: 0.5050411224, blue: 0.4410601556, alpha: 1)
        case "Ruby": return #colorLiteral(red: 0.8778958917, green: 0.07078518718, blue: 0.3718247414, alpha: 1)
        case "Yale": return #colorLiteral(red: 0.05504552275, green: 0.296012789, blue: 0.58018291, alpha: 1)
        case "Raspberry": return #colorLiteral(red: 0.7839210629, green: 0.117426835, blue: 0.2238128781, alpha: 1)
        case "Green": return .green
        default: return .black
        }
    }
}
