//
//  Array + RandomElements.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/9/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

extension Array {
    
    func randomElements(_ count: Int) -> [Element] {
        
        var randoms = [Element]()
        
        var givenCollection = self
        
        for _ in 0..<count {
            randoms.append(givenCollection.remove(at: Int.random(in: 0..<givenCollection.count)))
        }
        
        return randoms
        
    }
     
}

extension Dictionary {
    
    func randomElements(_ count: Int) -> [Element] {
        
        var result = [Element]()
        
        var elementsPool = self
        
        for _ in 0..<count {
            if let randomElement = elementsPool.randomElement() {
                elementsPool = elementsPool.filter {$0.key != randomElement.key}
                result.append(randomElement)
            }
        }
        
        return result
    }
    
}
