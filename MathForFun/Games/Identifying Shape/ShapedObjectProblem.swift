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
        let shapedObjects = [
            ShapedObject(id: 1, image: "ball", shape: .circle),
            ShapedObject(id: 2, image: "heart_fruit", shape: .heart),
            ShapedObject(id: 3, image: "icecream", shape: .cone),
            ShapedObject(id: 4, image: "money", shape: .rectangle),
            ShapedObject(id: 5, image: "pizza", shape: .triangle),
            ShapedObject(id: 6, image: "potato", shape: .oval),
            ShapedObject(id: 7, image: "circle_eye", shape: .circle),
            ShapedObject(id: 8, image: "pyramid", shape: .triangle),
            ShapedObject(id: 9, image: "stop_sign", shape: .octagon),
            ShapedObject(id: 10, image: "note", shape: .square)

        ]
        return [
            ShapedObjectProblem(shape: .circle, shapedObjects: [shapedObjects[0], shapedObjects[1], shapedObjects[2],shapedObjects[3]]),
            ShapedObjectProblem(shape: .octagon, shapedObjects: [shapedObjects[6], shapedObjects[8], shapedObjects[5],shapedObjects[3]]),
            ShapedObjectProblem(shape: .circle, shapedObjects: [shapedObjects[9], shapedObjects[1], shapedObjects[2],shapedObjects[6]]),
            ShapedObjectProblem(shape: .square, shapedObjects: [shapedObjects[9], shapedObjects[6], shapedObjects[2],shapedObjects[5]]),
            ShapedObjectProblem(shape: .oval, shapedObjects: [shapedObjects[0], shapedObjects[9], shapedObjects[2],shapedObjects[5]]),
            ShapedObjectProblem(shape: .cone, shapedObjects: [shapedObjects[0], shapedObjects[1], shapedObjects[2],shapedObjects[3]]),
            ShapedObjectProblem(shape: .triangle, shapedObjects: [shapedObjects[4], shapedObjects[1], shapedObjects[2],shapedObjects[3]]),
            ShapedObjectProblem(shape: .circle, shapedObjects: [shapedObjects[0], shapedObjects[1], shapedObjects[2],shapedObjects[3]]),
            ShapedObjectProblem(shape: .rectangle, shapedObjects: [shapedObjects[0], shapedObjects[3], shapedObjects[2],shapedObjects[8]]),
            ShapedObjectProblem(shape: .triangle, shapedObjects: [shapedObjects[0], shapedObjects[7], shapedObjects[6],shapedObjects[3]])
        ]
    }
    
    
    enum Shape: String {
        case cone = "Cone"
        case circle = "Circle"
        case heart = "Heart"
        case rectangle = "Rectangle"
        case square = "Square"
        case triangle = "Triangle"
        case oval = "Oval"
        case octagon = "Octagon"
    }
    
    
    struct ShapedObject: Identifiable {
        var id: Int
        var image: String
        var shape: Shape
    }
    
}
