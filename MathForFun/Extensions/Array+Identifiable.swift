//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Sajan Shrestha on 6/1/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
        
    func firstIndex(matching : Element) -> Int? {
        
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}

extension Array where Element: Hashable {
    
    func uniqueElement() -> Element? {
        
        let elementSet = Set(self)
        
        for element in elementSet {
            let count = self.filter { $0 == element }.count
            if count == 1 {
                return element
            }
        }
        return nil
    }
}



extension String {
    
    static func getOptions(for rightAnswer: String) -> [String] {
        
        var options = [String]()
        
        let rightAnswerInt = Int(rightAnswer)!
        
        let firstOption = rightAnswerInt > 1 ? rightAnswerInt - 1 : rightAnswerInt + 1
        let secondOption = rightAnswerInt > 2 ? rightAnswerInt - 2 : rightAnswerInt + 2
        let thirdOption = rightAnswerInt > 3 ? rightAnswerInt - 3 : rightAnswerInt + 3
        
        options.append(contentsOf: [rightAnswer, String(firstOption), String(secondOption), String(thirdOption)])
        
        return options.shuffled()
    }
}

extension Int {
    
    func generateOptions() -> [String] {
        
        var options = [String]()
                
        let firstOption = self > 1 ? self - 1 : self + 1
        let secondOption = self > 2 ? self - 2 : self + 2
        let thirdOption = self > 3 ? self - 3 : self + 3
        
        options.append(contentsOf: [String(self), String(firstOption), String(secondOption), String(thirdOption)])
        
        return options.shuffled()
    }
}
