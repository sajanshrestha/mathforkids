//
//  MultiplicationGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/24/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//



import SwiftUI

struct MultiplicationGameView: View {
    
    @ObservedObject var game: GameModel
    
    @State private var selectedAnswer = "0"

    
    @State private var answerCorrect = false
    
    @State private var levelUp = false

    @EnvironmentObject var playerLevel: PlayerLevel
    
    
    var level: Int
    
    var body: some View {
        
        let multiplicationProblem = game.problems[game.index] as! MultiplicationProblem
        
        return ZStack {
            
            VStack {
                ScoreView(answerCorrect: self.$answerCorrect, score: self.game.score)
                
                Spacer()
                                
                OperationView(firstNumber: multiplicationProblem.firstNumber, secondNumber: multiplicationProblem.secondNumber, operation: .multiplication)
                
                
                Spacer()
                
                
                Text("What is the product?")
                    .modifier(QuestionText())
                
                optionsView(for: multiplicationProblem)
                    .frame(height: optionsSectionHeight)
                    .disabled(self.game.gameCompleted || self.game.processingAnswer)
                .opacity(self.game.processingAnswer ? opacity : 1)
            }
            
            
            CorrectIcon(correct: $answerCorrect)
            
            ResultView(score: game.score).opacity(game.gameCompleted ? 1 : 0)
            
            LevelUpView(levelUp: $levelUp)
            
        }
    }
    
    func optionsView(for multiplicationProblem: MultiplicationProblem) -> some View {
        
        OptionsView(options: multiplicationProblem.options) { option in
            
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

struct MultiplicationGameView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationGameView(game: GameModel(), level: 1)
    }
}
