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
            
            
        }.opacity(self.gameSession.gameCompleted ? opacity : 1)
        
        
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
                        self.answerCorrect = self.gameSession.submitAnswer(with: item.content)
                    }
                    
                    if self.gameSession.lastProblemOn && self.gameSession.score > 7 {
                        self.levelUp = self.playerLevel.updateLevel(for: .classifying, playingLevel: self.level)
                    }
                    
                    DispatchQueue.actionOnMain(after: 1.0) {
                        self.answerCorrect = false
                        self.gameSession.next()
                    }
                    
                }, label: {
                    
                    Text(item.content).font(Font.system(size: size.width * self.textScalingFactor)).padding().border(Color.blue)
                    
                })
                    .disabled(self.gameSession.gameCompleted || self.gameSession.processingAnswer)
                    .opacity(self.gameSession.processingAnswer ? self.opacity : 1)
                    
            }
        }
    }
    
    // MARK: CONSTANTS
    private let spacing: CGFloat = 8
    private let opacity = 0.3
    private let textScalingFactor: CGFloat = 0.15
}
