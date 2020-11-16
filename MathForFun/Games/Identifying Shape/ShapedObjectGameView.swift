//
//  IdentifyingShapedObjectGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 11/10/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ShapedObjectGameView: View {
    
    
    @ObservedObject var gameSession = GameModel()

    @EnvironmentObject var playerLevel: PlayerLevel

    @State private var answerSelected = ""
    
    @Binding var answerCorrect: Bool
    
    @Binding var levelStatus: LevelStatus
    
    
    var level = GameModel.gameLevel

    var body: some View {
        
        let shapeProblem = gameSession.problems[gameSession.index] as! ShapedObjectProblem

        return VStack {
            ScoreView(answerCorrect: $answerCorrect, score: gameSession.score)
            
            ShapedObjectsGridView(shapedObjects: shapeProblem.shapedObjects) { answer in
                
                self.answerSelected = answer
                
                self.answerCorrect  = self.gameSession.submitAnswer(with: self.answerSelected)
                
                if self.gameSession.lastProblemOn {
                    
                    DispatchQueue.actionOnMain(after: 0.5) {
                        self.levelStatus = self.playerLevel.updateLevel(for: GameModel.game, playingLevel: self.level, with: self.gameSession.score)
                    }
                }
                
                DispatchQueue.actionOnMain(after: 1.0) {
                    self.answerCorrect = false
                    self.gameSession.next()
                }
            }
            .disabled(self.gameSession.gameCompleted || self.gameSession.processingAnswer)
            .opacity(self.gameSession.processingAnswer ? 0.5 : 1)
            
            Text("Tap the item which is in a shape of \(shapeProblem.rightAnswer)!")
                .modifier(QuestionText())
                        
        }
    }
}
