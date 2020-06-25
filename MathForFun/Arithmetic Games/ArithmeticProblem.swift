//
//  Arithmetic Problem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/25/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation


class ArithmeticProblem {
    
    var firstNumber: Int
    
    var secondNumber: Int
    
    init(for level: Int) {
        
        switch level {
            
        case 1:
            let numbers = levelOneNumbers.randomElements(2)
            (firstNumber, secondNumber) = (numbers[0], numbers[1])
        case 2:
            let numbers = levelTwoNumbers.randomElements(2)
            (firstNumber, secondNumber) = (numbers[0], numbers[1])

        case 3:
            let numbers = levelThreeNumbers.randomElements(2)
            (firstNumber, secondNumber) = (numbers[0], numbers[1])

        default:
            let numbers = levelOneNumbers.randomElements(2)
            (firstNumber, secondNumber) = (numbers[0], numbers[1])

        }
    }
    
    
    
    private let levelOneNumbers = Array(0...10)
    private let levelTwoNumbers = Array(5...20)
    private let levelThreeNumbers = Array(10...30)

    
}
