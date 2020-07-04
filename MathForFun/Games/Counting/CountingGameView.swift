//
//  ContentView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/3/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct CountingGameView: View {
    
    @ObservedObject var gameSession = GameModel()
        
    @State private var selectedAnswer = "0"
    
    @Binding var answerCorrect: Bool
    
    @Binding var levelUp: Bool

    @EnvironmentObject var playerLevel: PlayerLevel
    
    var level = GameModel.gameLevel

    var body: some View {
        
        let countingProblem = gameSession.problems[gameSession.index] as! CountingProblem
        
        return VStack {
                
                ScoreView(answerCorrect: self.$answerCorrect, score: self.gameSession.score)
                
                Spacer()
                
                QuestionView(countingProblem: countingProblem)
                
                Text("How many \(countingProblem.emojiName.lowercased())s are there?")
                    .modifier(QuestionText())
                    .animation(nil)
                                
                optionsView(for: countingProblem).frame(height: optionsSectionHeight)
                    .disabled(self.gameSession.gameCompleted || self.gameSession.processingAnswer)
                    .opacity(self.gameSession.processingAnswer ? opacity : 1)
                
                
            }
            .foregroundColor(.black)
            .font(.title)
            .opacity(gameSession.gameCompleted ? opacity : 1)
    }
    
    func optionsView(for countingProblem: CountingProblem) -> some View {
        
        OptionsView(options: countingProblem.options) { option in
            
            self.selectedAnswer = option
            
            self.answerCorrect = self.gameSession.submitAnswer(with: self.selectedAnswer)
            
            if self.gameSession.lastProblemOn && self.gameSession.score > 7 {
                self.levelUp = self.playerLevel.updateLevel(for: .counting, playingLevel: self.level)
            }
            
            DispatchQueue.actionOnMain(after: 1.0) {
                self.answerCorrect = false
                self.gameSession.next()
            }
        }
    }
   
    
    //  MARK: CONSTANTS
    private let spacing: CGFloat = 4
    private let optionsSectionHeight: CGFloat = 60
    private let opacity = 0.1
    
}


struct QuestionView: View {
    
    let countingProblem: CountingProblem
    
    var body: some View {
        
        var emojiViews = [EmojiView]()
        
        for index in 1...countingProblem.emojiCount {
            emojiViews.append(EmojiView(id: index, emoji: countingProblem.emoji))
        }
        
        return Grid(emojiViews) { emojiView in
            CardView(title: emojiView.emoji).padding()
        }
        
    }
    
}

struct EmojiView: Identifiable {
    var id: Int
    var emoji: String
}
