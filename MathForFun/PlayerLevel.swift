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
        guard let playerGameLevels = UserDefaults.getPlayerLevel() else {
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
    
    @discardableResult
    func updateLevel(for gameType: GameList.GameType, playingLevel: Int) -> Bool {
        
        let currentLevel = getCurrentLevel(for: gameType)
        
        if playingLevel == currentLevel {
            currentLevels[gameType.rawValue]! += 1
            UserDefaults.updatePlayerLevel(with: currentLevels)
            AudioPlayer.playCelebrationSound()
            return true
        }
        return false
    }
    
}
