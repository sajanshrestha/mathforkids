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
