//
//  SubtractionGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/24/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct SubtractionGameView: View {
    
    @ObservedObject var game: GameModel
    
    @State private var selectedAnswer = "0"

    
    @State private var answerCorrect = false
    
    @State private var levelUp = false

    @EnvironmentObject var playerLevel: PlayerLevel
    
    
    var level: Int
    
    var body: some View {
        
        let subtractionProblem = game.problems[game.index] as! SubtractionProblem
        
        return ZStack {
            
            VStack {
                ScoreView(answerCorrect: self.$answerCorrect, score: self.game.score)
                
                Spacer()
                                
                OperationView(firstNumber: subtractionProblem.firstNumber, secondNumber: subtractionProblem.secondNumber, operation: .subtraction)
                
                
                Spacer()
                
                
                Text("What is the difference?")
                    .modifier(QuestionText())
                
                optionsView(for: subtractionProblem)
                    .frame(height: optionsSectionHeight)
                    .disabled(self.game.gameCompleted || self.game.processingAnswer)
                .opacity(self.game.processingAnswer ? opacity : 1)
            }
            
            
            CorrectIcon(correct: $answerCorrect)
            
            ResultView(score: game.score).opacity(game.gameCompleted ? 1 : 0)
            
            LevelUpView(levelUp: $levelUp)
            
        }
    }
    
    func optionsView(for subtractionProblem: SubtractionProblem) -> some View {
        
        OptionsView(options: subtractionProblem.options) { option in
            
            self.selectedAnswer = option
            
            self.answerCorrect = self.game.submitAnswer(with: self.selectedAnswer)
            
            if self.game.lastProblemOn && self.game.score > 7 {
                self.updateLevel()
            }
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(Animation.spring()) {
                    self.answerCorrect = false
                    self.game.next()
                }
            }
        }
    }
    
    private func updateLevel() {
        if self.level == self.playerLevel.getCurrentLevel(for: .subtraction) {
            self.playerLevel.updateLevel(for: .subtraction, playingLevel: self.level)
            self.levelUp = true
        }
    }
    
    private let optionsSectionHeight: CGFloat = 60
    private let opacity = 0.2


}

struct SubtractionGameView_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionGameView(game: GameModel(), level: 1)
    }
}
