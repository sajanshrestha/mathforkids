//
//  IdentifyingShapedObjectProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 11/10/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation


struct ShapedObjectProblem: Problem {
    
    var shape: ShapedObjectProblem.Shape
    
    var shapedObjects: [ShapedObject]
    
    var rightAnswer: String {
        shape.rawValue
    }
    
    static func getProblems(count: Int) -> [ShapedObjectProblem] {
        
        var problems = [ShapedObjectProblem]()
               
        for _ in 1...count {
            let shapedObjects = [
                ShapedObject(id: 1, image: "cone", shape: .cone),
                ShapedObject(id: 2, image: "circle", shape: .circle),
                ShapedObject(id: 3, image: "cube", shape: .cube),
                ShapedObject(id: 4, image: "diamond", shape: .diamond)
            ]
            let identifyingShapedObjectProblem = ShapedObjectProblem(shape: .cone, shapedObjects: shapedObjects)
            problems.append(identifyingShapedObjectProblem)
        }
        
        return problems
    }
    
    
    enum Shape: String {
        case cone = "Cone"
        case circle = "Circle"
        case cube = "Cube"
        case diamond = "Diamond"
    }
    
    
    struct ShapedObject: Identifiable {
        var id: Int
        var image: String
        var shape: Shape
    }
    
}
