//
//  PositionProblemGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/7/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct PositionProblemGameView: View {
    
    @ObservedObject var game: GameModel
    
    @State private var answerCorrect = false
    
    var body: some View {
        
        let positionProblem = game.problems[game.index] as! PositionProblem
        
        return GeometryReader { geometry in
            
            ZStack {
                
                VStack {
                    
                    ScoreView(answerCorrect: self.$answerCorrect, score: self.game.score)
                    
                    Spacer()
                                            
                    self.questionView(for: positionProblem, of: geometry.size)
                    Spacer()
                                        
                    Text(positionProblem.questionText).padding().font(.title)
                                        
                    self.optionsView(for: positionProblem)
                        .frame(height: 60)
                        .disabled(self.game.gameCompleted || self.game.processingAnswer)
                        .opacity(self.game.processingAnswer ? 0.5 : 1)
                                        
                }
                .padding()
                .opacity(self.game.gameCompleted ? 0.3 : 1)
                

                CorrectIcon(correct: self.$answerCorrect)
                
                ResultView(score: self.game.score).opacity(self.game.gameCompleted ? 1 : 0)

            }
            
            
        }
        
    }
    
    func questionView(for problem: PositionProblem, of size: CGSize) -> some View {
        
        Group {
            if problem.orientation == .vertical {
                VStack(spacing: 20) {
                    self.view(for: problem.contents, size: size)
                }
            }
            else {
                HStack(spacing: 20) {
                    self.view(for: problem.contents, size: size)
                }
            }
        }
    }
    
    func view(for positionalElements: [String], size: CGSize) -> some View {
        ForEach(positionalElements, id: \.self) { content in
            Text(content).font(Font.system(size: size.width * 0.25)).border(Color.blue)
        }
    }
    
    func optionsView(for problem: PositionProblem) -> some View {
        
        OptionsView(options: problem.options) { selectedOption in
            
            withAnimation(Animation.spring()) {
                self.answerCorrect = self.game.submitAnswer(with: selectedOption)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.game.next()
                self.answerCorrect = false
            }
        }
    }
    
}

struct PositionProblemGameView_Previews: PreviewProvider {
    static var previews: some View {
        PositionProblemGameView(game: GameModel())
    }
}
