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
                    
                    Text("Score: \(self.game.score)").padding().font(.title)
                    
                    Spacer()
                    
                    self.questionView(for: positionProblem, of: geometry.size)
                                        
                    Text(positionProblem.questionText).padding().font(.title)
                    
                    Spacer()
                    
                    self.optionsView(for: positionProblem)
                    
                    Spacer()
                    
                }
                CorrectIcon(correct: self.$answerCorrect)
            }
            .padding()
            .opacity(self.game.gameCompleted ? 0.3 : 1)
            
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
        
        HStack {
            
            ForEach(problem.options, id: \.self) { name in
                
                Button(action: {
                        
                        withAnimation(Animation.spring()) {
                            self.answerCorrect = self.game.submitAnswer(with: name)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.game.next()
                            self.answerCorrect = false
                        }
                    
                }, label: {
                    Text(name)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                }).disabled(self.game.gameCompleted)
            }
        }
    }
    
}

struct PositionProblemGameView_Previews: PreviewProvider {
    static var previews: some View {
        PositionProblemGameView(game: GameModel())
    }
}
