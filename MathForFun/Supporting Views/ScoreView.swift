//
//  ScoreView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/9/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ScoreView: View {
    
    @Binding var answerCorrect: Bool
    
    let score: Int
    
    var body: some View {
        
        HStack {
            Text("Score :")
            Text("\(score)")
                .scaleEffect(answerCorrect ? 2 : 1)
                .foregroundColor(answerCorrect ? .green : .gray)
            Spacer()
            Text("out of 10")
                .foregroundColor(.blue)
                .font(.subheadline)
            
        }
        .padding()
        .font(.headline)
        
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(answerCorrect: .constant(true), score: 12)
    }
}
