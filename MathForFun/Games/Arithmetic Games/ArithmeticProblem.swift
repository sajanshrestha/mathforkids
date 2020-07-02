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
                problems.append(ArithmeticProblem.multiplication(firstNumber: multiplicationIntForLevelOne, secondNumber: multiplicationIntForLevelOne))
            case 2:
                problems.append(ArithmeticProblem.multiplication(firstNumber: multiplicationIntForLevelTwo, secondNumber: multiplicationIntForLevelTwo))
            default:
                problems.append(ArithmeticProblem.multiplication(firstNumber: multiplicationIntForLevelThree, secondNumber: multiplicationIntForLevelThree))

            }
        }
        
        return problems
    }
    
    private static func divisionProblems(for gameLevel: Int, count: Int) -> [ArithmeticProblem] {
        
        var problems = [ArithmeticProblem]()
        
        for _ in 0..<count {
            switch gameLevel {
            case 1:
                problems.append(ArithmeticProblem.division(firstNumber: divisionIntForLevelOne, secondNumber: 2))
            case 2:
                problems.append(ArithmeticProblem.division(firstNumber: divisionIntForLevelTwo, secondNumber: 3))
            default:
                problems.append(ArithmeticProblem.division(firstNumber: divisionIntForLevelThree, secondNumber: [2, 4].randomElement()!))

            }
        }
        
        return problems
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
    
    private static var multiplicationIntForLevelOne: Int {
        return Int.random(in: 0...3)
        
    }
    
    private static var multiplicationIntForLevelTwo: Int {
        return Int.random(in: 0...5)
        
    }
    
    private static var multiplicationIntForLevelThree: Int {
        return Int.random(in: 0...7)
        
    }
    
    private static var divisionIntForLevelOne: Int {
        return [2, 4, 6, 8, 10, 12].randomElement()!
        
    }
    
    private static var divisionIntForLevelTwo: Int {
        return [3, 6, 9, 12, 15, 18, 21, 24].randomElement()!
        
    }
    
    private static var divisionIntForLevelThree: Int {
        return [4, 8, 12, 16, 20, 24].randomElement()!
        
    }
}
