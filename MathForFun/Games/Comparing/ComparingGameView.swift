//
//  ComparingGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/4/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ComparingGameView: View {
    
    @ObservedObject var gameSession = GameModel()
    
    @Binding var answerCorrect: Bool
    
    @Binding var levelStatus: LevelStatus
    
    @EnvironmentObject var playerLevel: PlayerLevel
    
    var level = GameModel.gameLevel

    
    var body: some View {
        
        let comparingProblem = gameSession.problems[gameSession.index] as! ComparingProblem
        
        return GeometryReader { geometry in
            
            VStack(spacing: self.spacing) {
                
                ScoreView(answerCorrect: self.$answerCorrect, score: self.gameSession.score)
                
                Spacer()
                
                self.optionsView(for: comparingProblem)
                    .padding(.horizontal)
                    .disabled(self.gameSession.gameCompleted || self.gameSession.processingAnswer)
                    .opacity(self.gameSession.processingAnswer ? self.opacity : 1)
                
                
                Text(comparingProblem.questionText)
                    .modifier(QuestionText())
                
            }
            .font(.title)
            .opacity(self.gameSession.gameCompleted ? self.opacity : 1)
        }
    }
    
    func optionsView(for problem: ComparingProblem) -> some View {
        
        
        HStack {
            
            self.view(for: problem.firstSetEmoji, problem.firstSetCount)
                .onTapGesture {
                    
                    self.submitAnswer(with: ComparingProblem.ComparingSet.firstSet.rawValue)
                    
                    if self.gameSession.lastProblemOn {
                        DispatchQueue.actionOnMain(after: 0.5) {
                            self.levelStatus = self.playerLevel.updateLevel(for: GameModel.game, playingLevel: self.level, with: self.gameSession.score)
                        }
                    }
                                        
            }
            
            self.view(for: problem.secondSetEmoji, problem.secondSetCount)
                .onTapGesture {
                    
                    self.submitAnswer(with: ComparingProblem.ComparingSet.secondSet.rawValue)
                    
                    if self.gameSession.lastProblemOn {
                        DispatchQueue.actionOnMain(after: 0.5) {
                            self.levelStatus = self.playerLevel.updateLevel(for: GameModel.game, playingLevel: self.level, with: self.gameSession.score)
                        }
                    }
                    

            }
            
        }
        .disabled(self.gameSession.gameCompleted)
    }
    
    
    func view(for emoji: String, _ count: Int) -> some View {
        
        var emojisViewOne = [EmojiView]()
        
        for index in 0..<count {
            emojisViewOne.append(EmojiView(id: index, emoji: emoji))
        }
        
        return ZStack {
            
            Grid(emojisViewOne) { emojiView in
                CardView(title: emojiView.emoji).padding()
            }
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.blue, lineWidth: lineWidth)
            
        }
        
    }
    
    
    func submitAnswer(with answer: String) {
        
        answerCorrect = gameSession.submitAnswer(with: answer)
        
        DispatchQueue.actionOnMain(after: 1.0) {
            self.answerCorrect = false
            self.gameSession.next()
        }
        
    }
    
    
    // MARK: COSNTANTS
    private let opacity = 0.2
    private let spacing: CGFloat = 30
    private let scalingFactor: CGFloat = 0.75
    private let cornerRadius: CGFloat = 10
    private let lineWidth: CGFloat = 3


}
