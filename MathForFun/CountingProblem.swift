//
//  CountingProblem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/6/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

struct CountingProblem: Problem {
    
    let content: String
    let contentCount: Int
    let contentName: String
    
    var rightAnswer: String { String(contentCount) }
    
    var options: [String] {
        
        var options = [String]()
        
        let rightAnswerInt = Int(rightAnswer)!
        
        let firstOption = rightAnswerInt > 1 ? rightAnswerInt - 1 : rightAnswerInt + 1
        let secondOption = rightAnswerInt > 2 ? rightAnswerInt - 2 : rightAnswerInt + 2
        let thirdOption = rightAnswerInt > 3 ? rightAnswerInt - 3 : rightAnswerInt + 3
        
        options.append(contentsOf: [rightAnswer, String(firstOption), String(secondOption), String(thirdOption)])
        
        return options.shuffled()
        
    }
    
    
}
