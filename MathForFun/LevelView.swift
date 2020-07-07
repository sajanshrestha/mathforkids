//  LevelView.swift
//  MathForFun

/*
----------------------------------------------------------------
this view displays all the available levels for a selected game

initially, only Level One will be unlocked but the player can get a good
score and unlock the next level.

For any game, only the levels that are unlocked will appear green
----------------------------------------------------------------
*/

//  Created by Sajan Shrestha on 6/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.


import SwiftUI
 
struct LevelView: View {
    
    var game: GameList.Game
    
    @EnvironmentObject var playerLevel: PlayerLevel
    
    init(for game: GameList.Game) {
        self.game = game
    }
    
    var body: some View {
        
        let numberOfLevels = self.game.gameType.numberOfLevels
        
        return List(1...numberOfLevels, id: \.self) { currentLevel in
            self.view(for: currentLevel)
        }
    }
    
    private func view(for currentLevel: Int) -> some View {
        
        NavigationLink(destination: GameView(for: game.gameType, in: currentLevel) , label: {
            
            Text("Level \(currentLevel)")
                .font(Font.custom("Noteworthy", size: textSize))
                .bold()
                .foregroundColor(isHigherLevel(currentLevel) ? .gray : .green)
        }).disabled(isHigherLevel(currentLevel))
    }
    
    func isHigherLevel(_ level: Int) -> Bool {
        level > self.playerLevel.getCurrentLevel(for: self.game.gameType)
    }
    
    // MARK: CONSTANTS
    private let textSize: CGFloat = 28.0
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView(for: GameList.Game(id: 1, gameType: .counting))
    }
}
