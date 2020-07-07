//
//  IdentifyingShapeProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/6/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation
import UIKit


struct IdentifyingShapeProblem: Problem {
    
    var shapeEmoji: String
    var shape: String
    
    var rightAnswer: String { shape }
    
    var options: [String] {
        
        ["Square", "Triangle", "Rectangle", "Circle"].shuffled()
        
    }
    
    
    static func getProblems(count: Int, level: Int) -> [IdentifyingShapeProblem] {
        
        
        let shapes = getShapes(count: count, for: level)
        
        var problems = [IdentifyingShapeProblem]()
               
        for (shape, name) in shapes {
            problems.append(IdentifyingShapeProblem(shapeEmoji: shape, shape: name))
        }
        
        return problems
    }
    
    private static func getShapes(count: Int, for level: Int) -> [(key: String, value: String)] {
        switch level {
        case 1:
            return levelOneShapes.randomElements(count)
        case 2:
            return levelTwoShapes.randomElements(count)
        default:
            return levelTwoShapes.randomElements(count)
        }
    }
    
    private static let levelOneShapes = [
        "🔴": "Circle",
        "🚫": "Circle",
        "⚪️": "Circle",
        "💿": "Circle",
        "⬜️": "Square",
        "🔳": "Square",
        "🖼": "Square",
        "🚺": "Square",
        "📐": "Triangle",
        "⚠️": "Triangle",
        "🔺": "Triangle",
        "💳": "Rectangle"
    ]
    
    private static let levelTwoShapes = [
        "❇️": "Square",
        "🔟": "Square",
        "🎇": "Square",
        "🌁": "Square",
        "🏙": "Square",
        "⚽️": "Circle",
        "💵": "Rectangle",
        "🎚": "Rectangle",
        "⬜️": "Square",
        "🔳": "Square",
        "🖼": "Square",
        "🚺": "Square",
        "📐": "Triangle",
        "⚠️": "Triangle",
        "🔺": "Triangle",
        "💳": "Rectangle"
    ]
    
}

// "🛢":"Cylinder",
// "🔋": "Cylinder"
// "🎲": "Cube",





