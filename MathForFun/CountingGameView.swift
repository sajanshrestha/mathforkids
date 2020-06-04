//
//  ContentView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/3/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct CountingGameView: View {
    
    @ObservedObject var game: CountingGameModel
    
    @State private var selectedAnswer = "0"
    
    @State private var answerCorrect = false
    
    var body: some View {
        
        let countingProblem = game.problems[game.index]
        
        return ZStack {
            
            VStack {
                
                Text("Score: \(game.score)")
                    .font(.title).foregroundColor(.black)
                
                
                QuestionView(problem: countingProblem)
                
                Text("How many items?")
                    .font(.title)
                
                Spacer()
                
                optionsView(for: countingProblem)
                
                
            }
            .foregroundColor(.white)
            .opacity(game.gameOver ? 0.3 : 1)
                
            SuccessIcon(correct: $answerCorrect)

            
        }
    }
    
    func optionsView(for countingProblem: CountingGame.CountingGameProblem) -> some View {
        HStack(spacing: 20) {
            ForEach(countingProblem.options, id: \.self) { option in
                Button(action: {
                    self.selectedAnswer = "\(option)"
                    self.answerCorrect = self.game.submitAnswer(with: self.selectedAnswer)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.answerCorrect = false
                    }
                    
                }, label: {
                    Text("\(option)")
                        .padding(20)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .font(.title)
                    
                }).disabled(self.game.gameOver)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountingGameView(game: CountingGameModel())
    }
}


struct QuestionView: View {
    
    let problem: CountingGame.CountingGameProblem
    
    var body: some View {
        
        var emojiViews = [Content]()
        
        for index in 1...problem.countOfItems {
            emojiViews.append(Content(id: index, emoji: problem.emoji))
        }
        
        return Grid(emojiViews) { emojiView in
            
            CardView(title: emojiView.emoji).padding()
            
        }
        
    }
    
}




struct Content: Identifiable {
    var id: Int
    var emoji: String
}

