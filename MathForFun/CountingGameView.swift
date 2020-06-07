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
        
        let problem = game.problems[game.index]
        
        let countingProblem = problem as! CountingProblem

        
        return ZStack {
            
            VStack {
                
                Text("Score: \(game.score)")
                    .foregroundColor(.black)
                
                QuestionView(for: countingProblem)
                
                Text("How many \(countingProblem.contentName)?").padding(20)
                    
                Spacer()
                
                optionsView(for: problem)
                
                
            }
            .foregroundColor(.black)
            .font(.title)
            .opacity(game.gameCompleted ? 0.3 : 1)
            
            SuccessIcon(correct: $answerCorrect)

        }
    }
    
    func optionsView(for countingProblem: Problem) -> some View {
        HStack(spacing: 20) {
            ForEach(countingProblem.options, id: \.self) { option in
                Button(action: {
                    self.selectedAnswer = "\(option)"
                    
                    withAnimation(Animation.spring()) {
                        self.answerCorrect = self.game.submitAnswer(with: self.selectedAnswer)

                    }

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
    
    init(for problem: CountingProblem) {
        self.countingProblem = problem
    }
    
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

