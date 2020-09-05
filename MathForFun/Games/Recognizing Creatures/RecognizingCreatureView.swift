//
//  RecognizingCreatureView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 9/4/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct RecognizingCreatureGameView: View {
    
    @ObservedObject var gameSession = GameModel()
            
    @Binding var answerCorrect: Bool
    
    @Binding var levelStatus: LevelStatus

    @EnvironmentObject var playerLevel: PlayerLevel
    
    var level = GameModel.gameLevel
    
    var body: some View {
        
        let problem = gameSession.problems[gameSession.index] as! RecognizingCreatureProblem
        
        return VStack {
            
            Text(problem.questionText)
        }
    }
}
