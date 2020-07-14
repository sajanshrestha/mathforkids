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
    
    @Binding var levelUp: Bool
    
    
    var level = GameModel.gameLevel

    var body: some View {
        
        let shapeProblem = gameSession.problems[gameSession.index] as! IdentifyingShapeProblem
        
        return GeometryReader { geometry in
            
            VStack {
                
                ScoreView(answerCorrect: self.$answerCorrect, score: self.gameSession.score)
                
                Spacer()
                
                Text(shapeProblem.shapeEmoji)
                    .font(Font.system(size: min(geometry.size.width, geometry.size.height) * self.shapeScalingFactor))
                
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
    
    func optionsView(for problem: IdentifyingShapeProblem) -> some View {
        
        OptionsView(options: problem.options) { selectedOption in
            
            self.answerSelected = selectedOption
            
            withAnimation(Animation.spring()) {

                self.answerCorrect  = self.gameSession.submitAnswer(with: self.answerSelected)
            }
            
            if self.gameSession.lastProblemOn && self.gameSession.score > 7 {
                
                DispatchQueue.actionOnMain(after: 0.5) {
                    self.levelUp = self.playerLevel.updateLevel(for: GameModel.gameType, playingLevel: self.level)
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
    private let opacity = 0.3
    private let padding: CGFloat = 20

}
