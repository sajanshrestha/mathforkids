//
//  ComparingProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/6/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

struct ComparingProblem: Problem {
    
    enum ComparingSet: String {
        case firstSet
        case secondSet
    }
    
    let firstSetCount: Int
    let secondSetCount: Int
    
    let firstSetEmoji: String
    let secondSetEmoji: String
    
    var rightAnswer: String {
        firstSetCount > secondSetCount ? ComparingSet.firstSet.rawValue : ComparingSet.secondSet.rawValue
    }
    
    var options: [String] = []
    
    
}
