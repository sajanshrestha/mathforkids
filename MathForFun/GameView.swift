//
//  HomeView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/3/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct GameView: View {
    
    @State private var showGameView = false
    
    var gameType: GameList.GameType
        
    var level: Int
    
    var body: some View {
        
        self.view(for: gameType)
    }
    
    func view(for gameType: GameList.GameType) -> some View {
        
        // sets the game to the selected game type
        GameModel.gameType = gameType
        GameModel.gameLevel = level
        
        return Group {
            if gameType == .counting {
                CountingGameView(game: GameModel(), level: level)
            }
            else if gameType == .comparing {
                ComparingGameView(game: GameModel(), level: level)
            }
            else if gameType == .identifyingColor {
                ColorGameView(game: GameModel(), level: level)
            }
            else if gameType == .identifyingShape {
                ShapeGameView(game: GameModel(), level: level)
            }
            else if gameType == .position {
                PositionProblemGameView(game: GameModel())
            }
            else if gameType == .classifying {
                ClassifyingGameView(game: GameModel(), level: level)
            }
            
            else {
                Text("Game Coming Soon")
            }
        }
         
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameType: GameList.GameType.comparing, level: 2)
    }
}



