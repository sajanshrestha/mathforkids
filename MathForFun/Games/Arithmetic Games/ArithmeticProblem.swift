//
//  AdditionProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/23/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation


enum ArithmeticProblem: Problem {

    case addition(firstNumber: Int, secondNumber: Int)
    case subtraction(firstNumber: Int, secondNumber: Int)
    case multiplication(firstNumber: Int, secondNumber: Int)
    case division(firstNumber: Int, secondNumber: Int)
    
    var firstNumber: Int {
        switch self {
        case .addition(let first, _): return first
        case .subtraction(let first, let second): return max(first, second)
        case .multiplication(let first, _): return first
        case .division(let first, _): return first
        }
    }
    
    var secondNumber: Int {
        switch self {
        case .addition(_, let second): return second
        case .subtraction(let first, let second): return min(first, second)
        case .multiplication(_, let second): return second
        case .division(_, let second): return second
        }
    }
    
    var rightAnswer: String {
        
        switch self {
        case .addition(let first, let second): return "\(first + second)"
        case .subtraction(let first, let second): return "\(abs(first - second))"
        case .multiplication(let first, let second): return "\(first * second)"
        case .division(let first, let second): return "\(Int(first/second))"
        }
    }
    
    var options: [String] { String.getOptions(for: rightAnswer) }
    
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
        case .addition(_, _): return .addition
        case .subtraction(_, _): return .subtraction
        case .multiplication(_, _): return .multiplication
        case .division(_, _): return .division
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
            problems.append(ArithmeticProblem.addition(firstNumber: Int.random(in: 0...gameLevel*2), secondNumber: Int.random(in: 0...gameLevel*2)))
        }
        
        return problems
    }
    
    private static func subtractionProblems(for gameLevel: Int, count: Int) -> [ArithmeticProblem] {
        
        var problems = [ArithmeticProblem]()
        
        for _ in 0..<count {
            problems.append(ArithmeticProblem.subtraction(firstNumber: Int.random(in: 0...gameLevel*2), secondNumber: Int.random(in: 0...gameLevel*2)))
        }
        
        return problems
    }
    
    private static func multiplicationProblems(for gameLevel: Int, count: Int) -> [ArithmeticProblem] {
        
        var problems = [ArithmeticProblem]()
        
        for _ in 0..<count {
            problems.append(ArithmeticProblem.multiplication(firstNumber: Int.random(in: 0...gameLevel*2), secondNumber: Int.random(in: 0...gameLevel*2)))
        }
        
        return problems
    }
    
    private static func divisionProblems(for gameLevel: Int, count: Int) -> [ArithmeticProblem] {
        
        var problems = [ArithmeticProblem]()
        
        for _ in 0..<count {
            problems.append(ArithmeticProblem.division(firstNumber: divisor(for: gameLevel), secondNumber: dividend(for: gameLevel)))
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
