//
//  ResultView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/9/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    
    let score: Int
    
    var body: some View {
            GeometryReader { geometry in
                
                ZStack {
                    
                    Rectangle()
                        .frame(height: geometry.size.height / 2)
                    
                    if Array(1...5).contains(self.score) {
                        Text("Nice try, your score is \(self.score)")
                        .foregroundColor(.black)
                    }
                    else if Array(6...7).contains(self.score) {
                        Text("Awesome, your score is \(self.score)")
                        .foregroundColor(.black)
                    }
                    
                    else {
                       Text("Great job, your score is \(self.score).")
                        .foregroundColor(.black)
                    }
                }.padding()
            }
        
        .font(Font.custom("Noteworthy", size: 36))
        .foregroundColor(Color.white.opacity(0.5))

    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(score: 8)
    }
}

