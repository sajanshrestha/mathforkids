//
//  PlayerLevel.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

class PlayerLevel: ObservableObject {
    
    @Published var currentLevels = [String: Int]()
    
    init() {
        guard let playerGameLevels = UserDefaults.getPlayerLevel() else {
            
            resetLevels()
            
            return
            
        }
        self.currentLevels = playerGameLevels
    }
        
    func getCurrentLevel(for gameType: GameList.GameType) -> Int {
        currentLevels[gameType.rawValue] ?? 1
    }
    
    @discardableResult
    func levelUp(for gameType: GameList.GameType, playingLevel: Int) -> Bool {
        
        let currentLevel = getCurrentLevel(for: gameType)
        
        if playingLevel == currentLevel && gameType.numberOfLevels > playingLevel {
            currentLevels[gameType.rawValue]! += 1
            UserDefaults.updatePlayerLevel(with: currentLevels)
            AudioPlayer.playCelebrationSound()
            return true
        }
        return false
    }
    
    func resetLevels() {
        
        var restartLevels: [String: Int] = [:]
        
        GameList.GameType.allCases.forEach { gameType in
            restartLevels[gameType.rawValue] = 1
        }
        
        currentLevels = restartLevels
        
        UserDefaults.updatePlayerLevel(with: currentLevels)
        
    }
    
}
