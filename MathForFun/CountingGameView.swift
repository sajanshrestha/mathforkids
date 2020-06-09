//
//  ContentView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/3/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct CountingGameView: View {
    
    @ObservedObject var game: GameModel
    
    @State private var selectedAnswer = "0"
    
    @State private var answerCorrect = false
        
    var body: some View {
        
        let countingProblem = game.problems[game.index] as! CountingProblem
        
        
        return ZStack {
            
            VStack {
                
                ScoreView(answerCorrect: self.$answerCorrect, score: self.game.score)
                
                Spacer()
                
                QuestionView(countingProblem: countingProblem)
                
                Text("How many \(countingProblem.contentName) are there?").padding(20)
                                
                optionsView(for: countingProblem).frame(height: 60)
                    .disabled(self.game.gameCompleted || self.game.processingAnswer)
                    .opacity(self.game.processingAnswer ? 0.5 : 1)
                
                
            }
            .foregroundColor(.black)
            .font(.title)
            .opacity(game.gameCompleted ? 0.3 : 1)
            
            CorrectIcon(correct: $answerCorrect)
            
            ResultView(score: game.score).opacity(game.gameCompleted ? 1 : 0)
            
        }
    }
    
    func optionsView(for countingProblem: CountingProblem) -> some View {
        
        OptionsView(options: countingProblem.options) { option in
            
            self.selectedAnswer = option
            
            self.answerCorrect = self.game.submitAnswer(with: self.selectedAnswer)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(Animation.spring()) {
                    self.answerCorrect = false
                    self.game.next()
                }
            }
        }
    }
    
    //  MARK: CONSTANTS
    private let spacing: CGFloat = 4
    private let padding: CGFloat = 8
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameModel()
        GameModel.gameType = .counting
        return CountingGameView(game: game)
    }
}


struct QuestionView: View {
    
    let countingProblem: CountingProblem
    
    var body: some View {
        
        var emojiViews = [EmojiView]()
        
        for index in 1...countingProblem.contentCount {
            emojiViews.append(EmojiView(id: index, emoji: countingProblem.content))
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

