//
//  ClassifyingProblemView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/8/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ClassifyingGameView: View {
    
    @ObservedObject var game: GameModel
    
    @State private var answerCorrect = false
    
    var body: some View {
        
        let problem = game.problems[game.index] as! ClassifyingProblem
        
        return ZStack {
            
            VStack {
                
                Text("Score: \(self.game.score)").font(.title).padding()
                
                Spacer()
                
                self.body(for: problem)
                
                Spacer()
                
                Text("Tap The different item!").font(.title).padding()
                
            }
            
            CorrectIcon(correct: self.$answerCorrect)
                        
            
        }.opacity(self.game.gameCompleted ? 0.3 : 1)
        
    }
    
    func body(for problem: ClassifyingProblem) -> some View {
        
        GeometryReader { geometry in
            
            self.body(for: problem, of: geometry.size)
        }
    }
    
    func body(for problem: ClassifyingProblem, of size: CGSize) -> some View {
        
        VStack(spacing: spacing) {
            
            ForEach(problem.items) { item in
                
                Button(action: {
                    
                    withAnimation(Animation.spring()) {
                        self.answerCorrect = self.game.submitAnswer(with: item.content)
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.game.next()
                        self.answerCorrect = false
                    }
                    
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(Color.blue.opacity(0.5))
                            .frame(width: size.width * self.cardScalingFactor)
                        Text(item.content).font(Font.system(size: size.width * self.scalingFactor))
                    }
                    
                    
                })
                    .disabled(self.game.gameCompleted)
            }
        }
    }
    
    // MARK: CONSTANTS
    private let spacing: CGFloat = 8
    private let scalingFactor: CGFloat = 0.25
    private let cardScalingFactor: CGFloat = 0.3
}

struct ClassifyingProblemView_Previews: PreviewProvider {
    static var previews: some View {
        ClassifyingGameView(game: GameModel())
    }
}
