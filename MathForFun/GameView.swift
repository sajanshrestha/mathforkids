//
//  HomeView.swift
//  MathForFun

/*
----------------------------------------------------------------

----------------------------------------------------------------
*/

//  Created by Sajan Shrestha on 6/3/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct GameView: View {
        
    var gameType: GameList.GameType
        
    var level: Int
    
    init(for gameType: GameList.GameType, inLevel level: Int) {
        self.gameType = gameType
        self.level = level
    }
    
    var body: some View {
        
        self.view(for: gameType)
    }
    
    func view(for gameType: GameList.GameType) -> some View {
        
        // sets the game to the selected game type
        GameModel.gameType = gameType
        GameModel.gameLevel = level
        
        return Group {
            if gameType == .counting {
                CountingGameView(gameSession: GameModel(), level: level)
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
            
            else if gameType == .addition {
                AdditionGameView(game: GameModel(), level: level)
            }
            else if gameType == .subtraction {
                SubtractionGameView(game: GameModel(), level: level)
            }
            else if gameType == .multiplication {
                MultiplicationGameView(game: GameModel(), level: level)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(for: .counting, inLevel: 1)
    }
}



