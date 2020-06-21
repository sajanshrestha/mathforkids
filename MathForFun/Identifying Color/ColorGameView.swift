//
//  ColorGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ColorGameView: View {
    
    @ObservedObject var game: GameModel
    
    @State private var answerSelected = ""
    
    @State private var answerCorrect = false
    
    @State private var levelUp = false
    
    @EnvironmentObject var playerLevel: PlayerLevel

    var level: Int

    
    var body: some View {
        
        let colorProblem = game.problems[game.index] as! IdentifyingColorProblem
        
        return ZStack {
            VStack {
                
                ScoreView(answerCorrect: $answerCorrect, score: game.score)
                
                questionView(for: colorProblem)
                
                Text("What color is this?").font(.title).padding()
                
                Spacer()
                
                optionsView(for: colorProblem)
                    .frame(height: optionsSectionHeight)
                    .disabled(self.game.gameCompleted || self.game.processingAnswer)
                    .opacity(self.game.processingAnswer ? opacity : 1)
            }
            .opacity(game.gameCompleted ? opacity : 1)
            
            ResultView(score: game.score).opacity(game.gameCompleted ? 1 : 0)

            CorrectIcon(correct: $answerCorrect)
            
            LevelUpView(levelUp: $levelUp)

        }
        
    }
    
    func questionView(for problem: IdentifyingColorProblem) -> some View {
        GeometryReader { geometry in
            ZStack {
                
                Circle()
                    .opacity(self.opacity)
                
                Circle()
                    .padding()
                
            }.frame(width: min(geometry.size.width, geometry.size.height) * self.circleScalingFactor, height: min(geometry.size.width, geometry.size.height) * self.circleScalingFactor)
        }
        .padding()
        .foregroundColor(Color(problem.color))
    }
    
    func optionsView(for problem: IdentifyingColorProblem) -> some View {
        OptionsView(options: problem.options) { option in
            
            self.answerSelected = option
            
            withAnimation(Animation.spring()) {
                
                self.answerCorrect  = self.game.submitAnswer(with: self.answerSelected)
            }
            
            if self.game.index == self.game.problems.count - 1 && self.game.score > 7 {
                self.playerLevel.updateLevel(for: .identifyingColor, playingLevel: self.level)
                self.levelUp = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.game.next()
                self.answerCorrect = false
            }
        }
    }
    
    
    // MARK: CONSTANTS
    
    private let circleScalingFactor: CGFloat = 0.6
    private let opacity = 0.3
    private let optionsSectionHeight: CGFloat = 60

}

struct ColorGameView_Previews: PreviewProvider {
    static var previews: some View {
        ColorGameView(game: GameModel(), level: 2)
    }
}


