//
//  ClassifyAnimation.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/14/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ClassifyAnimation: View {
    
    @State private var disappear = false
    
    var body: some View {
        ZStack {
            Image(systemName: "hare")
            Image(systemName: "hare")
                .offset(x: 70)
            VStack(spacing: 14) {
                Text("I am different")
                    .font(Font.custom("Noteworthy", size: 16))
                .bold()
                    .rotationEffect(.degrees(-20))
                    .scaleEffect(disappear ? 1.1 : 1)
                    .foregroundColor(.green)
                Image(systemName: "tortoise")
                    .foregroundColor(.red)
                    
            }
            .offset(x: -70, y: -10)
                .animation(Animation.easeInOut(duration: 1).repeatCount(3, autoreverses: true))

            
        }.font(.largeTitle)
            .onAppear {
                self.disappear = true
        }
        
    }
}

struct ClassifyAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ClassifyAnimation()
    }
}
