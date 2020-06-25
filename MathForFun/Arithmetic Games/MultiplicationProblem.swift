//
//  MultiplicationProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/24/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation


class MultiplicationProblem: ArithmeticProblem, Problem {
    

    var rightAnswer: String {
        let result = firstNumber * secondNumber
        return "\(result)"
    }

    
    var options: [String] {
        String.getOptions(for: rightAnswer)
    }
    
    static func getProblems(count: Int, gameLevel: Int) -> [MultiplicationProblem] {
        
        var problems = [MultiplicationProblem]()
        
        for _ in 0..<count {
            problems.append(MultiplicationProblem(for: gameLevel))
        }
        
        return problems
    }
}
