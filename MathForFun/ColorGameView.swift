//
//  ColorGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ColorGameView: View {
    
    @ObservedObject var game: IdentifyingColorGameModel
    
    @State private var answerSelected = ""
    
    @State private var answerCorrect = false
        
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Circle()
                    .foregroundColor(Color(game.colors[game.index].color))
                    .frame(width: 200, height: 200)
                Spacer()
                
                optionsView()
            }
            .opacity(game.gameOver ? 0.3 : 1)
            SuccessIcon(correct: $answerCorrect)
        }
        
    }
    
    func optionsView() -> some View {
        HStack(spacing: 20) {
            ForEach(game.colors[game.index].options, id: \.self) { option in
                Button(action: {
                    self.answerSelected = option
                    self.answerCorrect  = self.game.submitAnswer(answer: self.answerSelected)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.answerCorrect = false
                    }
                    
                }, label: {
                    Text(option)
                    .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                        .foregroundColor(.white)
                    
                    
                }).disabled(self.game.gameOver)
            }
        }
    }
}

struct ColorGameView_Previews: PreviewProvider {
    static var previews: some View {
        ColorGameView(game: IdentifyingColorGameModel())
    }
}
