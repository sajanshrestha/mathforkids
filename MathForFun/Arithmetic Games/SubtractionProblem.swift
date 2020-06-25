//
//  SubtractionProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/24/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

class SubtractionProblem: ArithmeticProblem, Problem {
    

    var rightAnswer: String {
        let result = firstNumber - secondNumber
        return "\(result)"
    }
    
    override init(for level: Int) {
        
        super.init(for: level)
        let first = super.firstNumber
        let second = super.secondNumber
        self.firstNumber = max(first, second)
        self.secondNumber = min(first, second)
    }
    
    var options: [String] {
        String.getOptions(for: rightAnswer)
    }
    
    static func getProblems(count: Int, gameLevel: Int) -> [SubtractionProblem] {
        
        var problems = [SubtractionProblem]()
        
        for _ in 0..<count {
            problems.append(SubtractionProblem(for: gameLevel))
        }
        
        return problems
    }
}

