//
//  PlayerLevel.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

enum LevelStatus {
    case none
    case levelUp
    case levelAlreadyUp
    case levelNotUp
    case levelsComplete
}

class PlayerLevel: ObservableObject {
    
    @Published var currentLevels = [String: Int]()
    
    init() {
        
        guard var playerGameLevels = UserDefaults.getPlayerLevel() else {
            
            setInitialLevels()
            
            return
            
        }
        
        for game in GameList.Game.allCases {
            
            if !playerGameLevels.keys.contains(game.name) {
                
                playerGameLevels[game.name] = 1
                UserDefaults.updatePlayerLevel(with: playerGameLevels)
            }
        }
        
        self.currentLevels = playerGameLevels
    }
    
    private func setInitialLevels() {
        
        currentLevels = initialLevels
        
        UserDefaults.updatePlayerLevel(with: currentLevels)
    }
    
    var initialLevels: [String: Int] {
        
        var levels: [String: Int] = [:]
        
        for game in GameList.Game.allCases {
            levels[game.name] = 1
        }
        
        return levels
    }
        
    func getCurrentLevel(for game: GameList.Game) -> Int {
        
        currentLevels[game.name] ?? 1
    }
    
    
    @discardableResult
    func updateLevel(for game: GameList.Game, playingLevel: Int, with score: Int) -> LevelStatus {
        
        let currentLevel = getCurrentLevel(for: game)
        
        if score > MathForKids.levelUnlockingScore {
            
            if playingLevel == currentLevel && game.numberOfLevels > playingLevel {
                
                currentLevels[game.name]! += 1
                UserDefaults.updatePlayerLevel(with: currentLevels)
                AudioPlayer.playCelebrationSound()
                return .levelUp
            }
                
            else {
                return playingLevel < currentLevel ? .levelAlreadyUp : .levelsComplete
            }
        }
            
        else {
            
            return playingLevel < currentLevel ? .levelAlreadyUp : .levelNotUp
        }
    }
    
    func resetLevel(for game: GameList.Game) {
        
        currentLevels[game.name] = 1
        UserDefaults.updatePlayerLevel(with: currentLevels)
    }
    
}
