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
    
    @State private var answerCorrect = false
    @State private var levelStatus: LevelStatus = .none
        
    var game: GameList.Game
        
    var level: Int
    
    init(for game: GameList.Game, in level: Int) {
        self.game = game
        self.level = level
    }
    
    var body: some View {
        
        ZStack {
            
            if levelStatus == .none {
                
                self.view(for: game)
                    .foregroundColor(.gray)
                
                CorrectIcon(correct: $answerCorrect)
            }
            
            else {
                LevelStatusView(levelStatus: $levelStatus, level: level)
            }
        }
    }
    
    func view(for game: GameList.Game) -> some View {
        
        // sets the game to the selected game type
        GameModel.game = game
        GameModel.gameLevel = level
        
        return Group {
            if game == .counting {
                CountingGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            else if game == .comparing {
                ComparingGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            else if game == .identifyingColor {
                ColorGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            else if game == .identifyingShape {
                ShapeGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            else if game == .position {
                PositionProblemGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            else if game == .classifying {
                ClassifyingGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            
            else if game == .addition || game == .subtraction || game == .multiplication || game == .division {
                ArithmeticGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            
            else if game == .identifyingObjects {
                IdentifyingObjectsGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(for: .comparing, in: 3)
    }
}
