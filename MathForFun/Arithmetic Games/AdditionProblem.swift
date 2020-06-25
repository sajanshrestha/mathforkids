//
//  AdditionProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/23/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation


class AdditionProblem: ArithmeticProblem, Problem {
    
    var rightAnswer: String {
        let result = firstNumber + secondNumber
        return "\(result)"
    }
    
    var options: [String] {
        String.getOptions(for: rightAnswer)
    }
    
    static func getProblems(count: Int, gameLevel: Int) -> [AdditionProblem] {
        
        var problems = [AdditionProblem]()
        
        for _ in 0..<count {
            problems.append(AdditionProblem(for: gameLevel))
        }
        
        return problems
    }
    
}


