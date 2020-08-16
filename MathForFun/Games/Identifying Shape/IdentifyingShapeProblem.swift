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
    
    var shapeImageName: String
    
    var rightAnswer: String { shapeImageName.capitalized }
    
    var options: [String] {
        
        var options = [String]()
        
        var colorNames = ["circle", "square", "triangle", "rectangle", "oval", "diamond", "star", "hexagon"].map { $0.capitalized }
        
        options.append(shapeImageName.capitalized)
        
        colorNames.removeAll { $0 == shapeImageName.capitalized }
        
        options.append(contentsOf: colorNames.randomElements(3))
        
        options.shuffle()
        
        return options
        
    }
    
    
    static func getProblems(count: Int, level: Int) -> [IdentifyingShapeProblem] {
        
        
        let shapesImageNames = getShapeImageNames(for: level)
        
        var problems = [IdentifyingShapeProblem]()
               
        for shapeImageName in shapesImageNames {
            problems.append(IdentifyingShapeProblem(shapeImageName: shapeImageName))
        }
        
        return problems
    }
    
    private static func getShapeImageNames(for level: Int) -> [String] {
        switch level {
        case 1:
            return levelOneShapes
        case 2:
            return levelTwoShapes
        case 3:
            return levelThreeShapes
        default:
            return []
        }
    }
    
    private static let levelOneShapes = ["circle", "square", "triangle", "rectangle","circle", "square", "triangle", "rectangle", "circle", "square"]
    
    private static var levelTwoShapes: [String] {
        ["circle", "oval", "square", "diamond", "triangle", "star", "rectangle", "hexagon", "diamond", "oval"]
    }
    
    private static var levelThreeShapes: [String] {
         ["pentagon", "circle", "cone", "oval", "octagon", "crescent", "diamond", "cube", "oval", "triangle"]
    }
    
}
