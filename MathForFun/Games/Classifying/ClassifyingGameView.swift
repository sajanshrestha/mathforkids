//
//  ClassifyingProblemView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/8/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ClassifyingGameView: View {
    
    @ObservedObject var gameSession = GameModel()
    
    @Binding var answerCorrect: Bool
    
    @Binding var levelUp: Bool
    
    @EnvironmentObject var playerLevel: PlayerLevel
    
    var level = GameModel.gameLevel
    
    
    var body: some View {
        
        let problem = gameSession.problems[gameSession.index] as! ClassifyingProblem
        
        return VStack {
            
            ScoreView(answerCorrect: self.$answerCorrect, score: self.gameSession.score)
            
            Spacer()
            
            self.body(for: problem)
            
            Spacer()
            
            Text("Tap The different item!")
                .modifier(QuestionText())
            
            
        }.disabled(self.gameSession.gameCompleted || self.gameSession.processingAnswer)
        .opacity(self.gameSession.processingAnswer ? self.opacity : 1)
        
        
    }
    
    func body(for problem: ClassifyingProblem) -> some View {
        
        Grid(problem.items) { item in
            
            CardView(title: item.content)
                .padding()
                .onTapGesture {
                    withAnimation(Animation.spring()) {
                        self.answerCorrect = self.gameSession.submitAnswer(with: item.content)
                    }
                    
                    if self.gameSession.lastProblemOn && self.gameSession.score > 7 {
                        DispatchQueue.actionOnMain(after: 0.5) {
                            self.levelUp = self.playerLevel.levelUp(for: GameModel.gameType, playingLevel: self.level)
                        }
                    }
                    
                    DispatchQueue.actionOnMain(after: 1.0) {
                        self.answerCorrect = false
                        self.gameSession.next()
                    }
            }
        }
    }
    
    // MARK: CONSTANTS
    private let spacing: CGFloat = 8
    private let opacity = 0.3
    private let textScalingFactor: CGFloat = 0.10
}



