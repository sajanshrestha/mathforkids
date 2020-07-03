//
//  PositionProblemGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/7/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct PositionProblemGameView: View {
    
    @ObservedObject var gameSession = GameModel()

    @Binding var answerCorrect: Bool
    
    var body: some View {
        
        let positionProblem = gameSession.problems[gameSession.index] as! PositionProblem
        
        return GeometryReader { geometry in
            
            VStack {
                
                ScoreView(answerCorrect: self.$answerCorrect, score: self.gameSession.score)
                
                Spacer()
                
                self.questionView(for: positionProblem, of: geometry.size)
                Spacer()
                
                Text(positionProblem.questionText)
                    .modifier(QuestionText())
                
                
                self.optionsView(for: positionProblem)
                    .frame(height: self.optionsSectionHeight)
                    .disabled(self.gameSession.gameCompleted || self.gameSession.processingAnswer)
                    .opacity(self.gameSession.processingAnswer ? self.opacity : 1)
                
            }
            .padding()
            .opacity(self.gameSession.gameCompleted ? self.opacity : 1)
            
        }
    }
    
    func questionView(for problem: PositionProblem, of size: CGSize) -> some View {
        
        Group {
            if problem.orientation == .vertical {
                VStack(spacing: spacing) {
                    self.view(for: problem.contents, size: size)
                }
            }
            else {
                HStack(spacing: spacing) {
                    self.view(for: problem.contents, size: size)
                }
            }
        }
    }
    
    func view(for positionalElements: [String], size: CGSize) -> some View {
        ForEach(positionalElements, id: \.self) { content in
            Text(content).font(Font.system(size: min(size.width, size.height) * self.textScalingFactor)).padding().border(Color.blue)
        }
    }
    
    func optionsView(for problem: PositionProblem) -> some View {
        
        OptionsView(options: problem.options) { selectedOption in
            
            withAnimation(Animation.spring()) {
                self.answerCorrect = self.gameSession.submitAnswer(with: selectedOption)
            }
            
            DispatchQueue.actionOnMain(after: 1.0) {
                self.answerCorrect = false
                self.gameSession.next()
            }
        }
    }
    
    // MARK: CONSTANTS
    private let opacity = 0.3
    private let optionsSectionHeight: CGFloat = 60
    private let spacing: CGFloat = 20
    private let textScalingFactor: CGFloat = 0.15
    
    
    
}
