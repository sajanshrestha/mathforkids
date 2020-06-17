//
//  ComparingAnimation.swift
//  Animations
//
//  Created by Sajan Shrestha on 6/13/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ComparingAnimation: View {
    
    @State private var appear = false
    
    var body: some View {
        
        HStack(spacing: 20) {
            VStack(spacing: 30) {
                Image(systemName: "ant")
                Image(systemName: "ant.fill")
            }
            .opacity(self.appear ? 1 : 0)
            .animation(Animation.easeInOut(duration: 1.4).delay(0.4).repeatForever(autoreverses: true))
            
            Image(systemName: "greaterthan")
                .opacity(self.appear ? 1 : 0)
                .animation(Animation.spring().delay(2).repeatForever(autoreverses: true))
            
            Image(systemName: "ant.fill")
                .opacity(self.appear ? 1 : 0)
                .animation(Animation.spring().delay(0.9).repeatForever(autoreverses: true))
        }
        .font(Font.largeTitle)
        .foregroundColor(.purple)
        .onAppear {
            self.appear = true
        }
        
    }
}

struct ComparingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ComparingAnimation()
    }
}
