//
//  AdditionGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/23/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct AdditionGameView: View {
    
    @ObservedObject var game: GameModel
    
    @State private var selectedAnswer = "0"

    @State private var answerCorrect = false
    
    @State private var levelUp = false

    @EnvironmentObject var playerLevel: PlayerLevel
    
    
    var level: Int
    
    var body: some View {
        
        let additionProblem = game.problems[game.index] as! AdditionProblem
        
        return ZStack {
            
            VStack {
                
                ScoreView(answerCorrect: self.$answerCorrect, score: self.game.score)
                
                Spacer()
                                
                OperationView(firstNumber: additionProblem.firstNumber, secondNumber: additionProblem.secondNumber, operation: .addition)
                
                
                Spacer()
                
                
                Text("What is the sum?")
                    .modifier(QuestionText())
                
                optionsView(for: additionProblem)
                    .frame(height: optionsSectionHeight)
                    .disabled(self.game.gameCompleted || self.game.processingAnswer)
                    .opacity(self.game.processingAnswer ? opacity : 1)
            }
            
            
            CorrectIcon(correct: $answerCorrect)
            
            ResultView(score: game.score).opacity(game.gameCompleted ? 1 : 0)
            
            LevelUpView(levelUp: $levelUp)
            
        }
    }
    
    func optionsView(for additionProblem: AdditionProblem) -> some View {
        
        OptionsView(options: additionProblem.options) { option in
            
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
        if self.level == self.playerLevel.getCurrentLevel(for: .addition) {
            self.playerLevel.updateLevel(for: .addition, playingLevel: self.level)
            self.levelUp = true
        }
    }
    
    private let optionsSectionHeight: CGFloat = 60
    private let opacity = 0.2


}

struct AdditionGameView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionGameView(game: GameModel(), level: 1)
    }
}
