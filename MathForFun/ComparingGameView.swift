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
            VStack(spacing: 30) {
                
                Text("Score: \(self.game.score)")
                
                self.view(for: comparingProblem.firstSetEmoji, comparingProblem.firstSetCount).onTapGesture {
                    withAnimation(Animation.spring()) {
                        self.answerCorrect = self.game.submitAnswer(with: ComparingProblem.ComparingSet.firstSet.rawValue)
                    }
                    
                }
                .disabled(self.game.gameCompleted)
                
                self.view(for: comparingProblem.secondSetEmoji, comparingProblem.secondSetCount).onTapGesture {
                    self.answerCorrect = self.game.submitAnswer(with: ComparingProblem.ComparingSet.secondSet.rawValue)
                    
                }
                .disabled(self.game.gameCompleted)
                
                Text("Which box has more?")
                
                
            }
            .padding()
            .frame(height: geometry.size.height * 0.75)
            .font(.title)
            .opacity(self.game.gameCompleted ? 0.3 : 1)
        }
        
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
    
    
    
}

struct ComparingGameView_Previews: PreviewProvider {
    static var previews: some View {
        ComparingGameView(game: GameModel())
    }
}




