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
        
        var colorNames = ["Red", "Green", "Yellow", "Blue", "Pink", "Black"]
        
        options.append(colorName)
        
        colorNames.removeAll { $0 == colorName }
        
        for _ in 0..<3 {
            options.append(colorNames.remove(at: Int.random(in: 0..<colorNames.count)))
        }
        
        options.shuffle()
        
        return options
        
    }
    
}
