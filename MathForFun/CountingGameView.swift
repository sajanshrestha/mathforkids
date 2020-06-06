//
//  ContentView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/3/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct CountingGameView: View {
    
    @ObservedObject var countingGame: CountingGameModel
    
    @State private var selectedAnswer = "0"
    
    @State private var answerCorrect = false
    
    var body: some View {
        
        let countingProblem = countingGame.problems[countingGame.index]
        
        return ZStack {
            
            VStack {
                
                Text("Score: \(countingGame.score)")
                    .foregroundColor(.black)
                
                QuestionView(for: countingProblem)
                
                Text("How many \(countingProblem.contentName)?").padding(20)
                    
                Spacer()
                
                optionsView(for: countingProblem)
                
                
            }
            .foregroundColor(.black)
            .font(.title)
            .opacity(countingGame.gameOver ? 0.3 : 1)
            
            SuccessIcon(correct: $answerCorrect)

        }
    }
    
    func optionsView(for countingProblem: CountingGame.CountingGameProblem) -> some View {
        HStack(spacing: 20) {
            ForEach(countingProblem.options, id: \.self) { option in
                Button(action: {
                    self.selectedAnswer = "\(option)"
                    self.answerCorrect = self.countingGame.submitAnswer(with: self.selectedAnswer)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.answerCorrect = false
                    }
                    
                }, label: {
                    Text("\(option)")
                        .padding(20)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .font(.title)
                        .foregroundColor(.white)
                    
                }).disabled(self.countingGame.gameOver)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountingGameView(countingGame: CountingGameModel())
    }
}


struct QuestionView: View {
    
    let problem: CountingGame.CountingGameProblem
    
    init(for problem: CountingGame.CountingGameProblem) {
        self.problem = problem
    }
    
    var body: some View {
        
        var emojiViews = [EmojiView]()
        
        for index in 1...problem.contentCount {
            emojiViews.append(EmojiView(id: index, emoji: problem.content))
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

