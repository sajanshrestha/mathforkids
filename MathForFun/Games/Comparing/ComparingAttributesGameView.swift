//
//  ComparingAttributesGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 11/14/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI
import Foundation

struct ComparingAttributesGameView: View {
    
    @ObservedObject var gameSession = GameModel()
    
    @Binding var answerCorrect: Bool
    
    @Binding var levelStatus: LevelStatus
    
    @EnvironmentObject var playerLevel: PlayerLevel
    
    var level = GameModel.gameLevel

    
    var body: some View {
        
        var comparingProblem = gameSession.problems[gameSession.index] as! ComparingAttributesProblem
        
        let attributes = comparingProblem.attributePair.attributes
                        
        let firstAttribute = attributes.first!
        let secondAttribute = attributes.last!
        
        return VStack(spacing: self.spacing) {
            
            ScoreView(answerCorrect: self.$answerCorrect, score: self.gameSession.score)
            Spacer()
            HStack {
                
                Image(firstAttribute.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                    submitAnswer(with: firstAttribute.type.rawValue)
                }
                Image(secondAttribute.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        submitAnswer(with: secondAttribute.type.rawValue)
                    }
            }
            .padding(.horizontal)
            .disabled(self.gameSession.gameCompleted || self.gameSession.processingAnswer)
            .opacity(self.gameSession.processingAnswer ? self.opacity : 1)
            Spacer()
            
            Text(comparingProblem.questionText)
                .modifier(QuestionText())
            
        }
        .font(.title)
        .opacity(self.gameSession.gameCompleted ? self.opacity : 1)
    }
    
    
    func submitAnswer(with answer: String) {
        
        answerCorrect = gameSession.submitAnswer(with: answer)
        
        DispatchQueue.actionOnMain(after: 1.0) {
            self.answerCorrect = false
            self.gameSession.next()
        }
        
        if self.gameSession.lastProblemOn {
            DispatchQueue.actionOnMain(after: 0.5) {
                self.levelStatus = self.playerLevel.updateLevel(for: GameModel.game, playingLevel: self.level, with: self.gameSession.score)
            }
        }
        
    }
    
    
    // MARK: COSNTANTS
    private let opacity = 0.2
    private let spacing: CGFloat = 30
    private let scalingFactor: CGFloat = 0.75
    private let cornerRadius: CGFloat = 10
    private let lineWidth: CGFloat = 3


}

