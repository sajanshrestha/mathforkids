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
    
    @State private var levelUp = false
    
    @EnvironmentObject var playerLevel: PlayerLevel

    var level: Int

    
    var body: some View {
        
        let problem = game.problems[game.index] as! ClassifyingProblem
        
        return ZStack {
            
            VStack {
                
                ScoreView(answerCorrect: self.$answerCorrect, score: self.game.score)

                Spacer()
                
                self.body(for: problem)
                
                Spacer()
                
                Text("Tap The different item!").font(.title).padding()
                
            }.opacity(self.game.gameCompleted ? opacity : 1)
            
            ResultView(score: game.score).opacity(game.gameCompleted ? 1 : 0)
            
            CorrectIcon(correct: self.$answerCorrect)
                        
            LevelUpView(levelUp: $levelUp)

        }
        
    }
    
    func body(for problem: ClassifyingProblem) -> some View {
        
        GeometryReader { geometry in
            
            self.body(for: problem, of: geometry.size)
        }
    }
    
    func body(for problem: ClassifyingProblem, of size: CGSize) -> some View {
        
        HStack(spacing: spacing) {
            
            ForEach(problem.items) { item in
                
                Button(action: {
                    
                    withAnimation(Animation.spring()) {
                        self.answerCorrect = self.game.submitAnswer(with: item.content)
                    }
                    
                    if self.game.index == self.game.problems.count - 1 && self.game.score > 7 {
                        self.playerLevel.updateLevel(for: .classifying, playingLevel: self.level)
                        self.levelUp = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.game.next()
                        self.answerCorrect = false
                    }
                    
                }, label: {
                    
                    Text(item.content).font(Font.system(size: size.width * self.textScalingFactor)).padding().border(Color.blue)
                    
                })
                    .disabled(self.game.gameCompleted || self.game.processingAnswer)
                    .opacity(self.game.processingAnswer ? self.opacity : 1)
                    
            }
        }
    }
    
    // MARK: CONSTANTS
    private let spacing: CGFloat = 8
    private let opacity = 0.3
    private let textScalingFactor: CGFloat = 0.15
}

struct ClassifyingProblemView_Previews: PreviewProvider {
    static var previews: some View {
        ClassifyingGameView(game: GameModel(), level: 2)
    }
}
