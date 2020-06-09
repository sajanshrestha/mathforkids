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
    
    var body: some View {
        
        let colorProblem = game.problems[game.index] as! IdentifyingColorProblem
        
        return ZStack {
            VStack {
                
                ScoreView(answerCorrect: $answerCorrect, score: game.score)
                
                questionView(for: colorProblem)
                
                Text("What color is this?").font(.title).padding(20)
                
                Spacer()
                
                optionsView(for: colorProblem)
                    .frame(height: 60)
                    .disabled(self.game.gameCompleted || self.game.processingAnswer)
                    .opacity(self.game.processingAnswer ? 0.5 : 1)
            }
            .opacity(game.gameCompleted ? 0.3 : 1)
            
            ResultView(score: game.score).opacity(game.gameCompleted ? 1 : 0)

            CorrectIcon(correct: $answerCorrect)
        }
        
    }
    
    func questionView(for problem: IdentifyingColorProblem) -> some View {
        ZStack {
            Circle()
                .opacity(0.3)
            
            Circle()
                .padding(10)
            
        }
        .padding(40)
        .foregroundColor(Color(problem.color))
    }
    
    func optionsView(for problem: IdentifyingColorProblem) -> some View {
        OptionsView(options: problem.options) { option in
            
            self.answerSelected = option
            
            withAnimation(Animation.spring()) {
                
                self.answerCorrect  = self.game.submitAnswer(with: self.answerSelected)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.game.next()
                self.answerCorrect = false
            }
        }
    }
}

struct ColorGameView_Previews: PreviewProvider {
    static var previews: some View {
        ColorGameView(game: GameModel())
    }
}


