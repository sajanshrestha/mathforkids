//
//  AdditionGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/23/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ArithmeticGameView: View {
    
    @ObservedObject var game = GameModel()
    
    @EnvironmentObject var playerLevel: PlayerLevel
    
    @State private var selectedAnswer = "0"

    @Binding var answerCorrect: Bool
    
    @Binding var levelStatus: LevelStatus

    var level = GameModel.gameLevel
    
    private var resultTitleText:  String {
        
        let resultTitles: [GameList.GameType: String] = [.addition: "sum", .subtraction: "difference", .multiplication: "product", .division: "quotient"]
        return resultTitles[GameModel.gameType] ?? "result"
        
    }
    
    var body: some View {
        
        let arithmeticProblem = game.problems[game.index] as! ArithmeticProblem
        
        return VStack {
            
            ScoreView(answerCorrect: self.$answerCorrect, score: self.game.score)
            
            Spacer()
            
            OperationView(firstNumber: arithmeticProblem.firstNumber, secondNumber: arithmeticProblem.secondNumber, operation: arithmeticProblem.arithmeticOperation)
            
            Spacer()
            
            
            Text("What is the \(self.resultTitleText)?")
                .modifier(QuestionText())
            
            optionsView(for: arithmeticProblem)
                .disabled(self.game.gameCompleted || self.game.processingAnswer)
                .opacity(self.game.processingAnswer ? opacity : 1)
        }
        .opacity(game.gameCompleted ? opacity : 1)
    }
    
    func optionsView(for arithmeticProblem: ArithmeticProblem) -> some View {
        
        OptionsView(options: arithmeticProblem.options) { option in
                        
            self.answerCorrect = self.game.submitAnswer(with: option)
            
            if self.game.lastProblemOn  {
                DispatchQueue.actionOnMain(after: 0.5) {
                    self.levelStatus = self.playerLevel.updateLevel(for: GameModel.gameType, playingLevel: self.level, with: self.game.score)
                }
            }
            
            DispatchQueue.actionOnMain(after: 1.0) {
                self.answerCorrect = false
                self.game.next()
            }
        }
    }
    
    
    // MARK:- CONSTANTS
    
    private let opacity = 0.5

}

struct AdditionGameView_Previews: PreviewProvider {
    static var previews: some View {
        ArithmeticGameView(answerCorrect: .constant(true), levelStatus: .constant(.levelUp))
    }
}

