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
    
    
    var firstNumber: Int {
        switch self {
        case .addition(let first, _): return first
        case .subtraction(let first, let second): return max(first, second)
        case .multiplication(let first, _): return first
        }
        
    }
    
    var secondNumber: Int {
        switch self {
        case .addition(_, let second): return second
        case .subtraction(let first, let second): return min(first, second)
        case .multiplication(_, let second): return second
        }
    }
    
    var rightAnswer: String {
        
        switch self {
        case .addition(let first, let second): return "\(first + second)"
        case .subtraction(let first, let second): return "\(abs(first - second))"
        case .multiplication(let first, let second): return "\(first * second)"
        }
    }
    
    var options: [String] { String.getOptions(for: rightAnswer) }
    
    static func getProblems(count: Int, gameLevel: Int, for operation: Operation) -> [ArithmeticProblem] {
                
        switch operation {
            
        case .addition:
            return additionProblems(for: gameLevel, count: count)
            
        case .subtraction:
            return subtractionProblems(for: gameLevel, count: count)

        case .multiplication:
            return multiplicationProblems(for: gameLevel, count: count)

        }
    }
   
    
    private static func additionProblems(for gameLevel: Int, count: Int) -> [ArithmeticProblem] {
        
        var problems = [ArithmeticProblem]()
        
        for _ in 0..<count {
            
            switch gameLevel {
            case 1:
                problems.append(ArithmeticProblem.addition(firstNumber: levelOneInt, secondNumber: levelOneInt))
            case 2:
                problems.append(ArithmeticProblem.addition(firstNumber: levelTwoInt, secondNumber: levelTwoInt))
            default:
                problems.append(ArithmeticProblem.addition(firstNumber: levelThreeInt, secondNumber: levelThreeInt))

            }
        }
        
        return problems
    }
    
    private static func subtractionProblems(for gameLevel: Int, count: Int) -> [ArithmeticProblem] {
        
        var problems = [ArithmeticProblem]()
        
        for _ in 0..<count {
            
            switch gameLevel {
            case 1:
                problems.append(ArithmeticProblem.subtraction(firstNumber: levelOneInt, secondNumber: levelOneInt))
            case 2:
                problems.append(ArithmeticProblem.subtraction(firstNumber: levelTwoInt, secondNumber: levelTwoInt))
            default:
                problems.append(ArithmeticProblem.subtraction(firstNumber: levelThreeInt, secondNumber: levelThreeInt))

            }
            
        }
        
        return problems
    }
    
    private static func multiplicationProblems(for gameLevel: Int, count: Int) -> [ArithmeticProblem] {
        
        var problems = [ArithmeticProblem]()
        
        for _ in 0..<count {
            switch gameLevel {
            case 1:
                problems.append(ArithmeticProblem.multiplication(firstNumber: levelOneInt, secondNumber: levelOneInt))
            case 2:
                problems.append(ArithmeticProblem.multiplication(firstNumber: levelTwoInt, secondNumber: levelTwoInt))
            default:
                problems.append(ArithmeticProblem.multiplication(firstNumber: levelThreeInt, secondNumber: levelThreeInt))

            }
        }
        
        return problems
    }
    
    enum Operation {
        case addition
        case subtraction
        case multiplication
    }
    
    
    private static var levelOneInt: Int {
        return Int.random(in: 0...5)
    }
    
    private static var levelTwoInt: Int {
        return Int.random(in: 0...10)
    }
    
    private static var levelThreeInt: Int {
        return Int.random(in: 5...20)
    }
    
}
