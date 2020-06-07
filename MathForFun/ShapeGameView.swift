//
//  ShapeGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ShapeGameView: View {
    
    @ObservedObject var game: GameModel
    
    @State private var answerSelected = ""
    
    @State private var answerCorrect = false
    
    var body: some View {
        
        let shapeProblem = game.problems[game.index] as! IdentifyingShapeProblem
        
        
        
        return GeometryReader { geometry in
            
            ZStack {
                VStack {
                    
                    Text("Score: \(self.game.score)").padding().font(.title)

                    
                    Spacer()
                    
                    Text(shapeProblem.shapeEmoji)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.60))
                    
                    Spacer()
                    
                    Text("What shape is this?").font(.title).padding(20)


                    
                    self.optionsView(for: shapeProblem)
                }
                .opacity(self.game.gameCompleted ? 0.3 : 1)
                SuccessIcon(correct: self.$answerCorrect)
            }
        }
        
    }
    
    func optionsView(for problem: IdentifyingShapeProblem) -> some View {
        HStack(spacing: 20) {
            ForEach(problem.options, id: \.self) { option in
                Button(action: {
                    self.answerSelected = option
                    withAnimation(Animation.spring()) {

                        self.answerCorrect  = self.game.submitAnswer(with: self.answerSelected)
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.answerCorrect = false
                    }

                }, label: {
                    Text(option)
                        .font(Font.system(size: 13))
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)


                }).disabled(self.game.gameCompleted)
            }
        }.padding()
    }
}

struct ShapeGameView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeGameView(game: GameModel())
    }
}
