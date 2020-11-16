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
    
    static func getProblems(count: Int, level: Int) -> [ShapedObjectProblem] {
        switch level {
        case 4:
            return problemsForLevelFour(count: count)
        default:
            return problemsForLevelFive(count: count)
        }
    }
    
    static func problemsForLevelFour(count: Int) -> [ShapedObjectProblem] {
        var problems = [ShapedObjectProblem]()
        for _ in 1...count {
            problems.append(randomShapeProblem(from: levelFourObjects))
        }
        return problems
    }
    
    static func problemsForLevelFive(count: Int) -> [ShapedObjectProblem] {
        var problems = [ShapedObjectProblem]()
        for _ in 1...count {
            problems.append(randomShapeProblem(from: levelFiveObjects))
        }
        return problems
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
        case semiCircle = "Semi-Circle"
        case diamond = "Diamond"
        case crescent = "Crescent"
        case star = "Star"
    }
    
    
    struct ShapedObject: Identifiable {
        var id: Int
        var image: String
        var shape: Shape
    }
    
    
    static private let levelFourObjects = [
        ShapedObject(id: 1, image: "ball", shape: .circle),
        ShapedObject(id: 2, image: "icecream", shape: .cone),
        ShapedObject(id: 3, image: "money", shape: .rectangle),
        ShapedObject(id: 4, image: "pizza", shape: .triangle),
        ShapedObject(id: 5, image: "potato", shape: .oval),
        ShapedObject(id: 6, image: "circle_eye", shape: .circle),
        ShapedObject(id: 7, image: "pyramid", shape: .triangle),
        ShapedObject(id: 8, image: "note", shape: .square),
        ShapedObject(id: 9, image: "two_square_loafs", shape: .square),
        ShapedObject(id: 10, image: "phone", shape: .rectangle),
        ShapedObject(id: 11, image: "red_clock", shape: .circle),
        ShapedObject(id: 12, image: "sandwich", shape: .square),
        ShapedObject(id: 13, image: "nacho", shape: .triangle),
        ShapedObject(id: 14, image: "warning_sign", shape: .triangle),
        ShapedObject(id: 15, image: "sail_boat", shape: .triangle),
        ShapedObject(id: 16, image: "sun", shape: .circle),
        ShapedObject(id: 17, image: "earth", shape: .circle),
        ShapedObject(id: 18, image: "chocolate_bar", shape: .rectangle),
    ]
    
    static private let levelFiveObjects = [
        ShapedObject(id: 12, image: "heart_fruit", shape: .heart),
        ShapedObject(id: 13, image: "kite", shape: .diamond),
        ShapedObject(id: 14, image: "icecream_cone", shape: .cone),
        ShapedObject(id: 15, image: "pineapple", shape: .oval),
        ShapedObject(id: 16, image: "potato", shape: .oval),
        ShapedObject(id: 17, image: "star", shape: .star),
        ShapedObject(id: 18, image: "party_hat", shape: .cone),
        ShapedObject(id: 19, image: "moon", shape: .crescent),
        ShapedObject(id: 20, image: "stop_sign", shape: .octagon),
        ShapedObject(id: 21, image: "half_watermelon", shape: .semiCircle),

    ]
    
    static private func randomShapeProblem(from objects: [ShapedObject]) -> ShapedObjectProblem {
        
        var options = [ShapedObjectProblem.ShapedObject]()
        
        while options.count < 4 {
            let randomShapedObject = objects.randomElement()!
            
            if !options.contains(where: { $0.shape == randomShapedObject.shape }) {
                options.append(randomShapedObject)
            }
        }
        
        let chosenObject = options.randomElement()!
        return ShapedObjectProblem(shape: chosenObject.shape, shapedObjects: options)
    }
    
}
