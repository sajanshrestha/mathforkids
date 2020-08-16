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
        
    var gameType: GameList.GameType
        
    var level: Int
    
    init(for gameType: GameList.GameType, in level: Int) {
        self.gameType = gameType
        self.level = level
    }
    
    var body: some View {
        
        ZStack {
            
            if levelStatus == .none {
                
                self.view(for: gameType)
                    .foregroundColor(.gray)
                    .padding()
                
                CorrectIcon(correct: $answerCorrect)
            }
            
            else {
                LevelStatusView(levelStatus: $levelStatus, level: level)
            }
        }
    }
    
    func view(for gameType: GameList.GameType) -> some View {
        
        // sets the game to the selected game type
        GameModel.gameType = gameType
        GameModel.gameLevel = level
        
        return Group {
            if gameType == .counting {
                CountingGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            else if gameType == .comparing {
                ComparingGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            else if gameType == .identifyingColor {
                ColorGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            else if gameType == .identifyingShape {
                ShapeGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            else if gameType == .position {
                PositionProblemGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            else if gameType == .classifying {
                ClassifyingGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            
            else if gameType == .addition || gameType == .subtraction || gameType == .multiplication || gameType == .division {
                ArithmeticGameView(answerCorrect: $answerCorrect, levelStatus: $levelStatus)
            }
            
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(for: .comparing, in: 3)
    }
}
