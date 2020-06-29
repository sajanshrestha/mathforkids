//
//  AdditionGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/23/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ArithmeticGameView: View {
    
    @ObservedObject var game: GameModel
    
    @State private var selectedAnswer = "0"

    @State private var answerCorrect = false
    
    @State private var levelUp = false

    @EnvironmentObject var playerLevel: PlayerLevel
    
    var level: Int
    
    private var resultTitleText:  String {
        
        let resultTitles: [GameList.GameType: String] = [.addition: "sum", .subtraction: "difference", .multiplication: "product"]
        return resultTitles[GameModel.gameType] ?? "result"
        
    }
    
    var body: some View {
        
        let arithmeticProblem = game.problems[game.index] as! ArithmeticProblem
                        
        return ZStack {
                        
            VStack {
                
                ScoreView(answerCorrect: self.$answerCorrect, score: self.game.score)
                
                Spacer()
                                
                OperationView(firstNumber: arithmeticProblem.firstNumber, secondNumber: arithmeticProblem.secondNumber, operation: arithmeticProblem.arithmeticOperation)
                
                Spacer()
                
                
                Text("What is the \(self.resultTitleText)?")
                    .modifier(QuestionText())
                
                optionsView(for: arithmeticProblem)
                    .frame(height: optionsSectionHeight)
                    .disabled(self.game.gameCompleted || self.game.processingAnswer)
                    .opacity(self.game.processingAnswer ? opacity : 1)
            }
            
            
            CorrectIcon(correct: $answerCorrect)
            
            ResultView(score: game.score).opacity(game.gameCompleted ? 1 : 0)
            
            LevelUpView(levelUp: $levelUp)
            
        }
    }
    
    func optionsView(for arithmeticProblem: ArithmeticProblem) -> some View {
        
        OptionsView(options: arithmeticProblem.options) { option in
            
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
        if self.level == self.playerLevel.getCurrentLevel(for: GameModel.gameType) {
            self.playerLevel.updateLevel(for: GameModel.gameType, playingLevel: self.level)
            self.levelUp = true
        }
    }
    
    // MARK: CONSTANTS
    
    private let optionsSectionHeight: CGFloat = 60
    private let opacity = 0.2


}

struct AdditionGameView_Previews: PreviewProvider {
    static var previews: some View {
        ArithmeticGameView(game: GameModel(), level: 1)
    }
}
