//
//  PlayerLevel.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

class PlayerLevel: ObservableObject {
    
    @Published var currentLevels: [String: Int]
    
    init() {
        guard let playerGameLevels = UserDefaults.standard.value(forKey: "PlayerLevel") as? [String: Int] else {
            currentLevels = [:]
            GameList.GameType.allCases.forEach { gameType in
                currentLevels[gameType.rawValue] = 1
            }
            return
        }
        self.currentLevels = playerGameLevels
    }
        
    func getCurrentLevel(for gameType: GameList.GameType) -> Int {
        currentLevels[gameType.rawValue] ?? 1
    }
    
    func updateLevel(for gameType: GameList.GameType, playingLevel: Int) {
        
        if playingLevel == currentLevels[gameType.rawValue]! {
            currentLevels[gameType.rawValue]! += 1
            UserDefaults.standard.set(currentLevels, forKey: "PlayerLevel")
        }
    }
    
}
