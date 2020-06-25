//
//  ShapeGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ShapeGameView: View {
    
    @ObservedObject var game: GameModel
    
    @EnvironmentObject var playerLevel: PlayerLevel

    @State private var answerSelected = ""
    
    @State private var answerCorrect = false
    
    @State private var levelUp = false
    
    
    var level: Int
    
    var body: some View {
        
        let shapeProblem = game.problems[game.index] as! IdentifyingShapeProblem
        
        return GeometryReader { geometry in
            
            ZStack {
                
                VStack {
                    
                    ScoreView(answerCorrect: self.$answerCorrect, score: self.game.score)

                    Spacer()
                    
                    Text(shapeProblem.shapeEmoji)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height) * self.shapeScalingFactor))
                    
                    Spacer()
                    
                    Text("What shape is this?")
                        .modifier(QuestionText())


                    self.optionsView(for: shapeProblem)
                        .frame(height: self.optionsSectionHeight)
                        .disabled(self.game.gameCompleted || self.game.processingAnswer)
                        .opacity(self.game.processingAnswer ? self.opacity : 1)
                    
                }
                .opacity(self.game.gameCompleted ? self.opacity : 1)
                
                ResultView(score: self.game.score).opacity(self.game.gameCompleted ? 1 : 0)
                
                CorrectIcon(correct: self.$answerCorrect)
                
                LevelUpView(levelUp: self.$levelUp)

            }
        }
        
    }
    
    func optionsView(for problem: IdentifyingShapeProblem) -> some View {
        
        OptionsView(options: problem.options) { selectedOption in
            
            self.answerSelected = selectedOption
            
            withAnimation(Animation.spring()) {

                self.answerCorrect  = self.game.submitAnswer(with: self.answerSelected)
            }
            
            if self.game.lastProblemOn && self.game.score > 7 {
                
                if self.level == self.playerLevel.getCurrentLevel(for: .identifyingShape) {
                    self.playerLevel.updateLevel(for: .identifyingShape, playingLevel: self.level)
                    self.levelUp = true
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.game.next()
                self.answerCorrect = false
            }
        }
    }
    
    // MARK: CONSTANTS
    
    private let shapeScalingFactor: CGFloat = 0.3
    private let opacity = 0.3
    private let optionsSectionHeight: CGFloat = 60
    private let padding: CGFloat = 20

}

struct ShapeGameView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeGameView(game: GameModel(), level: 2)
    }
}
