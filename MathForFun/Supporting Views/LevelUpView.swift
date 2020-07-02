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
    
    @State private var name = UserDefaults.standard.value(forKey: "user_name") as? String ?? "player"
    
    var body: some View {
        ZStack {
            Text("Congratulations \(name), your level is up 😊")
                .font(Font.custom("Noteworthy", size: fontSize))
                .bold()
                .opacity(levelUp ? 1 : 0)
                .scaleEffect(levelUp ? 1: 0.5)
                .animation(Animation.easeInOut(duration: 2.0))
                .offset(x: 0, y: offsetFactor)
                .foregroundColor(.green)
                .padding()
            
            if levelUp {
                LottieView(filename: "confetti")
                    .offset(x: 0, y: -250)
            }
            
            
        }
           
    }
    
    // MARK: CONSTANTS
    private let fontSize: CGFloat = 30.0
    private let offsetFactor: CGFloat = -350
}

struct LevelUpView_Previews: PreviewProvider {
    static var previews: some View {
        LevelUpView(levelUp: .constant(true))
    }
}

