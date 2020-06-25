//
//  ContentView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/3/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct CountingGameView: View {
    
    @ObservedObject var gameSession: GameModel
        
    @State private var selectedAnswer = "0"
    
    @State private var answerCorrect = false
    
    @State private var levelUp = false

    @EnvironmentObject var playerLevel: PlayerLevel
    
    var level: Int
        
    var body: some View {
        
        let countingProblem = gameSession.problems[gameSession.index] as! CountingProblem
        
        return ZStack {
            
            VStack {
                
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
            
            CorrectIcon(correct: $answerCorrect)
            
            ResultView(score: gameSession.score).opacity(gameSession.gameCompleted ? 1 : 0)
            
             
            
            LevelUpView(levelUp: $levelUp)
            
        }
    }
    
    func optionsView(for countingProblem: CountingProblem) -> some View {
        
        OptionsView(options: countingProblem.options) { option in
            
            self.selectedAnswer = option
            
            self.answerCorrect = self.gameSession.submitAnswer(with: self.selectedAnswer)
            
            if self.gameSession.lastProblemOn && self.gameSession.score > 7 {
                self.updateLevel()
            }
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(Animation.spring()) {
                    self.answerCorrect = false
                    self.gameSession.next()
                }
            }
        }
    }
    
    private func updateLevel() {
        if self.level == self.playerLevel.getCurrentLevel(for: .counting) {
            self.playerLevel.updateLevel(for: .counting, playingLevel: self.level)
            self.levelUp = true
        }
    }
    
    //  MARK: CONSTANTS
    private let spacing: CGFloat = 4
    private let optionsSectionHeight: CGFloat = 60
    private let opacity = 0.2
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameModel()
        GameModel.gameType = .counting
        return CountingGameView(gameSession: game, level: 2)
    }
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

