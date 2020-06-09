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
