//
//  AdditionProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/23/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation


enum ArithmeticProblem: Problem {

    case addition(firstNumber: Int, secondNumber: Int, options: [String])
    case subtraction(firstNumber: Int, secondNumber: Int, options: [String])
    case multiplication(firstNumber: Int, secondNumber: Int, options: [String])
    case division(firstNumber: Int, secondNumber: Int, options: [String])
    
    var firstNumber: Int {
        switch self {
        case .addition(let first, _, _): return first
        case .subtraction(let first, let second, _): return max(first, second)
        case .multiplication(let first, _, _): return first
        case .division(let first, _, _): return first
        }
    }
    
    var secondNumber: Int {
        switch self {
        case .addition(_, let second, _): return second
        case .subtraction(let first, let second, _): return min(first, second)
        case .multiplication(_, let second, _): return second
        case .division(_, let second, _): return second
        }
    }
    
    var rightAnswer: String {
        
        switch self {
        case .addition(let first, let second, _): return "\(first + second)"
        case .subtraction(let first, let second, _): return "\(abs(first - second))"
        case .multiplication(let first, let second, _): return "\(first * second)"
        case .division(let first, let second, _): return "\(Int(first/second))"
        }
    }
    
    var options: [String] {
        switch self {
        case .addition(_, _, let options): return options
        case .subtraction(_, _, let options): return options
        case .multiplication(_, _, let options): return options
        case .division(_, _, let options): return options
        }
    }
    
    static func getProblems(count: Int, gameLevel: Int, for operation: ArithmeticOperation) -> [ArithmeticProblem] {
                
        switch operation {
            
        case .addition:
            return additionProblems(for: gameLevel, count: count)
            
        case .subtraction:
            return subtractionProblems(for: gameLevel, count: count)

        case .multiplication:
            return multiplicationProblems(for: gameLevel, count: count)
            
        case .division:
            return divisionProblems(for: gameLevel, count: count)

        }
    }
    
    var arithmeticOperation: ArithmeticOperation {
        switch self {
        case .addition(_, _, _): return .addition
        case .subtraction(_, _, _): return .subtraction
        case .multiplication(_, _, _): return .multiplication
        case .division(_, _, _): return .division
        }
    }
    
    enum ArithmeticOperation {
        case addition
        case subtraction
        case multiplication
        case division
    }
}


extension ArithmeticProblem {
    
    
    private static func additionProblems(for gameLevel: Int, count: Int) -> [ArithmeticProblem] {
        
        var problems = [ArithmeticProblem]()
        
        for _ in 0..<count {
            let first = Int.random(in: 0...gameLevel*2)
            let second = Int.random(in: 0...gameLevel*2)
            let options = (first + second).generateOptions()
            problems.append(ArithmeticProblem.addition(firstNumber: first, secondNumber: second, options: options))
        }
        
        return problems
    }
    
    private static func subtractionProblems(for gameLevel: Int, count: Int) -> [ArithmeticProblem] {
        
        var problems = [ArithmeticProblem]()
        
        for _ in 0..<count {
            let first = Int.random(in: 0...gameLevel*2)
            let second = Int.random(in: 0...gameLevel*2)
            let options = (first - second).generateOptions()
            problems.append(ArithmeticProblem.subtraction(firstNumber: first, secondNumber: second, options: options))
        }
        
        return problems
    }
    
    private static func multiplicationProblems(for gameLevel: Int, count: Int) -> [ArithmeticProblem] {
        
        var problems = [ArithmeticProblem]()
        
        for _ in 0..<count {
            let first = Int.random(in: 0...gameLevel*2)
            let second = Int.random(in: 0...gameLevel*2)
            let options = (first * second).generateOptions()
            problems.append(ArithmeticProblem.multiplication(firstNumber: first, secondNumber: second, options: options))
        }
        
        return problems
    }
    
    private static func divisionProblems(for gameLevel: Int, count: Int) -> [ArithmeticProblem] {
        
        var problems = [ArithmeticProblem]()
        
        for _ in 0..<count {
            let first = divisor(for: gameLevel)
            let second = dividend(for: gameLevel)
            let options = Int(first/second).generateOptions()
            problems.append(ArithmeticProblem.division(firstNumber: first, secondNumber: second, options: options))
        }
        
        return problems
    }
    
    private static func divisor(for level: Int) -> Int {
        randomMultiple(of: level+1)
    }
    
    private static func dividend(for level: Int) -> Int {
        level+1
    }
    
    private static func randomMultiple(of number: Int) -> Int {
        Array(1...10).map { $0*number }.randomElement()!
    }
}
