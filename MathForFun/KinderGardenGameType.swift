//
//  KinderGardenGameType.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

enum KinderGardenGameType: String, CaseIterable, Identifiable {
    
    case counting = "Counting"
    case comparing = "Comparing"
    case identifyShapes = "Identifying Shapes"
    case identifyingColors = "Identifying Colors"
    
    var id: String {
        self.rawValue
    }
    
    var itemCounts: [Int]? {
        switch self {
        case .counting:
            return [3, 5, 7, 10]
        case .comparing:
            return [3, 5, 7]
        case .identifyShapes:
            return nil
        case .identifyingColors:
            return nil
        }
    }
   
}
