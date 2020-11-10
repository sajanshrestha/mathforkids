//
//  ShapeGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ShapeGameView: View {
    
    @ObservedObject var gameSession = GameModel()

    @EnvironmentObject var playerLevel: PlayerLevel

    @State private var answerSelected = ""
    
    @Binding var answerCorrect: Bool
    
    @Binding var levelStatus: LevelStatus
    
    
    var level = GameModel.gameLevel

    var body: some View {
        
        let shapeProblem = gameSession.problems[gameSession.index] as! ShapeProblem
        
        return GeometryReader { geometry in
            
            VStack {
                
                ScoreView(answerCorrect: self.$answerCorrect, score: self.gameSession.score)
                
                Spacer()
                
                ShapeView(shape: shapeProblem.shapeImageName)
                
                Spacer()
                
                Text("What shape is this?")
                    .modifier(QuestionText())
                
                
                self.optionsView(for: shapeProblem)
                    .disabled(self.gameSession.gameCompleted || self.gameSession.processingAnswer)
                    .opacity(self.gameSession.processingAnswer ? self.opacity : 1)
                
            }
            .opacity(self.gameSession.gameCompleted ? self.opacity : 1)
            
        }
        
    }
    
    func optionsView(for problem: ShapeProblem) -> some View {
        
        OptionsView(options: problem.options) { selectedOption in
            
            self.answerSelected = selectedOption
            
            
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
    }
    
    // MARK: CONSTANTS
    
    private let shapeScalingFactor: CGFloat = 0.4
    private let opacity = 0.5
    private let padding: CGFloat = 20

}
