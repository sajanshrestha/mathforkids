//
//  ColorGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ColorGameView: View {
    
    @ObservedObject var game = GameModel()
        
    @Binding var answerCorrect: Bool
    
    @Binding var levelStatus: LevelStatus
    
    @EnvironmentObject var playerLevel: PlayerLevel

    var level = GameModel.gameLevel
    
    var body: some View {
        
        let colorProblem = game.problems[game.index] as! IdentifyingColorProblem
        
        return VStack {
            
            ScoreView(answerCorrect: $answerCorrect, score: game.score)
            
            questionView(for: colorProblem)
            
            Text("What color is this?")
                .modifier(QuestionText())
            
            Spacer()
            
            optionsView(for: colorProblem)
                .disabled(self.game.gameCompleted || self.game.processingAnswer)
                .opacity(self.game.processingAnswer ? opacity : 1)
        }
    }
    
    func questionView(for problem: IdentifyingColorProblem) -> some View {
        GeometryReader { geometry in
            ZStack {
                
                Circle()
                    .opacity(self.opacity)
                    .foregroundColor(.red)
                
                Circle()
                    .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                    .foregroundColor(Color(problem.color))
                
            }.frame(width: min(geometry.size.width, geometry.size.height) * self.circleScalingFactor, height: min(geometry.size.width, geometry.size.height) * self.circleScalingFactor)
        }
        .padding()
        
    }
    
    func optionsView(for problem: IdentifyingColorProblem) -> some View {
        
        OptionsView(options: problem.options) { option in
                        
            self.answerCorrect  = self.game.submitAnswer(with: option)
            
            if self.game.lastProblemOn {
                DispatchQueue.actionOnMain(after: 0.5) {
                    self.levelStatus = self.playerLevel.updateLevel(for: GameModel.game, playingLevel: self.level, with: self.game.score)
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.game.next()
                self.answerCorrect = false
            }
        }
    }
    
    
    // MARK: CONSTANTS
    
    private let circleScalingFactor: CGFloat = 0.7
    private let opacity = 0.5

}
