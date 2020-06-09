//
//  ComparingGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/4/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ComparingGameView: View {
    
    @ObservedObject var game: GameModel
    
    @State private var answerCorrect = false
    
    var body: some View {
        
        let comparingProblem = game.problems[game.index] as! ComparingProblem
        
        return GeometryReader { geometry in
            
            ZStack {
                
                VStack(spacing: 30) {
                    
                    ScoreView(answerCorrect: self.$answerCorrect, score: self.game.score)

                    self.optionsView(for: comparingProblem)
                        .disabled(self.game.gameCompleted || self.game.processingAnswer)
                        .opacity(self.game.processingAnswer ? 0.5 : 1)
                        
                    
                    Text("Which box has more?")
                    
                }
                .font(.title)
                .opacity(self.game.gameCompleted ? 0.3 : 1)
                
                
                CorrectIcon(correct: self.$answerCorrect)
                
                ResultView(score: self.game.score).opacity(self.game.gameCompleted ? 1 : 0)
                
            }
            .padding()
            .frame(height: geometry.size.height * 0.75)
            
            
        }
        
    }
    
    func optionsView(for problem: ComparingProblem) -> some View {
        
        VStack {
            
            self.view(for: problem.firstSetEmoji, problem.firstSetCount).onTapGesture {
                
                self.submitAnswer(with: ComparingProblem.ComparingSet.firstSet.rawValue)
                
            }
            
            self.view(for: problem.secondSetEmoji, problem.secondSetCount).onTapGesture {
                
                self.submitAnswer(with: ComparingProblem.ComparingSet.secondSet.rawValue)
            }
            
        }
        .disabled(self.game.gameCompleted)
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
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 4)
                .foregroundColor(.green)
            
        }
        
    }
    
    
    func submitAnswer(with answer: String) {
        answerCorrect = game.submitAnswer(with: answer)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(Animation.spring()) {
                self.answerCorrect = false
                self.game.next()
            }
        }
    }
    
    
}

struct ComparingGameView_Previews: PreviewProvider {
    static var previews: some View {
        ComparingGameView(game: GameModel())
    }
}




