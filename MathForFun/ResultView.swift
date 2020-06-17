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
        Group {
            if score > 6 {
                
                    Text("Great job, your score is \(score)")
                    .font(.largeTitle)
                
            }
            else {
                Text("Good try, your score is \(score)")
            }
        }
            
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(score: 8)
    }
}

