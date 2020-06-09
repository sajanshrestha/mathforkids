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
        Text("Your Score is \(score)")
            .font(.largeTitle)
            .scaleEffect(1.5)
            
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(score: 8)
    }
}
