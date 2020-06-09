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
                
                Text("Score: \(game.score)")
                    .foregroundColor(.black)
                
                QuestionView(countingProblem: countingProblem)
                
                Text("How many \(countingProblem.contentName) are there?").padding(20)
                
                Spacer()
                
                optionsView(for: countingProblem)
                
                
            }
            .foregroundColor(.black)
            .font(.title)
            .opacity(game.gameCompleted ? 0.3 : 1)
            
            CorrectIcon(correct: $answerCorrect)
            
        }
    }
    
    func optionsView(for countingProblem: CountingProblem) -> some View {
        HStack(spacing: 20) {
            ForEach(countingProblem.options, id: \.self) { option in
                Button(action: {
                    self.selectedAnswer = "\(option)"
                    
                    self.answerCorrect = self.game.submitAnswer(with: self.selectedAnswer)

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation(Animation.spring()) {
                            self.answerCorrect = false
                            self.game.next()
                        }
                    }
                    
                }, label: {
                    Text("\(option)")
                        .padding(20)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .font(.title)
                        .foregroundColor(.white)
                    
                }).disabled(self.game.gameCompleted)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountingGameView(game: GameModel())
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

