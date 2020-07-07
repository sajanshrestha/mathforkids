//
//  LevelUpView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct LevelUpView: View {
    
    @Binding var levelUp: Bool
    
    var name = UserDefaults.getUserName()

    @Environment(\.presentationMode) var presentation
    
    var level: Int
    
    var body: some View {
        ZStack {
            Text("Congratulations \(name) 😊, you unlocked Level \(level + 1)")
                .font(Font.custom("Noteworthy", size: fontSize))
                .bold()
                .opacity(levelUp ? 1 : 0)
                .scaleEffect(levelUp ? 1: 0.5)
                .animation(Animation.easeInOut(duration: 2.0))
                .foregroundColor(.green)
                .padding()
                .offset(x: 0, y: -100)
            
            if levelUp {
                LottieView(filename: "confetti")
            }
            
            Button(action: {
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Text("Play Next Level").font(.title)
            })
        }
    }
    
    // MARK: CONSTANTS
    private let fontSize: CGFloat = 30.0
    private let offsetFactor: CGFloat = -350
}

struct LevelUpView_Previews: PreviewProvider {
    static var previews: some View {
        LevelUpView(levelUp: .constant(true), level: 1)
    }
}

