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
    
    @State private var answerSelected = ""
    
    @State private var answerCorrect = false
    
    var body: some View {
        
        let shapeProblem = game.problems[game.index] as! IdentifyingShapeProblem
        
        return GeometryReader { geometry in
            
            ZStack {
                
                VStack {
                    
                    ScoreView(answerCorrect: self.$answerCorrect, score: self.game.score)

                    Spacer()
                    
                    Text(shapeProblem.shapeEmoji)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.60))
                    
                    Spacer()
                    
                    Text("What shape is this?").font(.title).padding(20)

                    self.optionsView(for: shapeProblem)
                        .frame(height: 60)
                        .disabled(self.game.gameCompleted || self.game.processingAnswer)
                        .opacity(self.game.processingAnswer ? 0.5 : 1)
                    
                }
                .opacity(self.game.gameCompleted ? 0.3 : 1)
                
                ResultView(score: self.game.score).opacity(self.game.gameCompleted ? 1 : 0)
                
                CorrectIcon(correct: self.$answerCorrect)
            }
        }
        
    }
    
    func optionsView(for problem: IdentifyingShapeProblem) -> some View {
        
        OptionsView(options: problem.options) { selectedOption in
            
            self.answerSelected = selectedOption
            
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

struct ShapeGameView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeGameView(game: GameModel())
    }
}
