//
//  IdentifyingShapeProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/6/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation



struct IdentifyingShapeProblem: Problem {
    
    var shapeEmoji: String
    var shape: String
    
    var rightAnswer: String { shape }
    
    var options: [String] { ["Square", "Triangle", "Rectangle", "Circle"] }
    
}









//        var options = [String]()
//
//        var colorNames = ["Square", "Triangle", "Rectangle", "Circle"]
//
//        options.append(rightAnswer)
//
//        colorNames.removeAll { $0 == colorName }
//
//        for _ in 0..<3 {
//            options.append(colorNames.remove(at: Int.random(in: 0..<colorNames.count)))
//        }
//
//        options.shuffle()
//
//        return options
