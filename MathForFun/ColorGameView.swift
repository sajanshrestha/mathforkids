//
//  ColorGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ColorGameView: View {
    
    @ObservedObject var game: GameModel
    
    @State private var answerSelected = ""
    
    @State private var answerCorrect = false
    
    var body: some View {
        
        let colorProblem = game.problems[game.index] as! IdentifyingColorProblem
        
        return ZStack {
            VStack {
                
                Text("Score: \(game.score)").padding().font(.title)
                
                Spacer()
                
                questionView(for: colorProblem)
                
                Text("What color is this?").font(.title).padding(20)
                
                Spacer()
                
                optionsView(for: colorProblem)
            }
            .opacity(game.gameCompleted ? 0.3 : 1)
            
            CorrectIcon(correct: $answerCorrect)
        }
        
    }
    
    func questionView(for problem: IdentifyingColorProblem) -> some View {
        ZStack {
            Circle()
                .opacity(0.3)
            
            Circle()
                .padding(10)
            
        }
        .padding(40)
        .foregroundColor(Color(problem.color))
    }
    
    func optionsView(for problem: IdentifyingColorProblem) -> some View {
        
        HStack(spacing: 20) {
            
            ForEach(problem.options, id: \.self) { option in
                
                Button(action: {
                    self.answerSelected = option
                    
                    withAnimation(Animation.spring()) {
                        
                        self.answerCorrect  = self.game.submitAnswer(with: self.answerSelected)
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.game.next()
                        self.answerCorrect = false
                    }
                    
                }, label: {
                    Text(option)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    
                }).disabled(self.game.gameCompleted)
            }
        }
    }
}

struct ColorGameView_Previews: PreviewProvider {
    static var previews: some View {
        ColorGameView(game: GameModel())
    }
}
