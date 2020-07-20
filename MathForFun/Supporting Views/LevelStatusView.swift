//
//  LevelUpView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct LevelStatusView: View {
    
    @Binding var levelStatus: LevelStatus
    
    var name = UserDefaults.getUserName()
    
    @Environment(\.presentationMode) var presentation
    
    var level: Int
    
    var body: some View {
        Group {
            
            if levelStatus == .levelUp {
                ZStack {
                    Text("Congratulations! You have unlocked level \(level + 1).")
                        .bold()
                        .modifier(StatusText())
                        .opacity(levelStatus == .levelUp ? 1 : 0)
                        .scaleEffect(levelStatus == .levelUp ? 1: 0.5)
                        .animation(Animation.easeInOut(duration: 2.0))
                        .offset(x: 0, y: -100)
                    
                    if levelStatus == .levelUp {
                        LottieView(filename: "confetti")
                    }
                    
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }, label: {
                        Text("Play Next Level").font(.title)
                    })
                }
            }
                
            else if levelStatus == .levelAlreadyUp {
                VStack(spacing: 40) {
                    
                    LottieView(filename: "doggie")
                    .frame(width: lottieAnimationWidth, height: lottieAnimationHeight)
                    
                    Text("You had already unlocked \(level + 1). But practicing more is always good.")
                        .bold()
                        .modifier(StatusText())
                    
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }, label: {
                        Text("Play Other Levels").font(.title)
                    })
                    
                }
            }
            else if levelStatus == .levelNotUp {
                
                
                VStack(spacing: 40) {
                    
                    LottieView(filename: "kids")
                        .frame(width: lottieAnimationWidth, height: lottieAnimationHeight)
                    
                    Text("Good try! Try to score 8 or more to unlock level \(level + 1).")
                        .bold()
                        .modifier(StatusText())
                    
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }, label: {
                        Text("Play Again").font(.title)
                    })
                    
                }
                
            }
            else if levelStatus == .levelsComplete {
                
                VStack(spacing: 40) {
                    
                    LottieView(filename: "student")
                        .frame(width: lottieAnimationWidth - 100, height: lottieAnimationHeight - 100)
                    
                    Text("Awesome! You have completed all the levels. Try playing other games or keep practicing these.")
                        .bold()
                        .modifier(StatusText())
                    
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }, label: {
                        Text("Play Other Levels").font(.title)
                    })
                    
                }
            }
        }
    }
    
    // MARK: CONSTANTS
    private let offsetFactor: CGFloat = -350
    private let lottieAnimationWidth: CGFloat = 300
    private let lottieAnimationHeight: CGFloat = 300
    
}

struct LevelUpView_Previews: PreviewProvider {
    static var previews: some View {
        LevelStatusView(levelStatus: .constant(.levelUp), level: 2)
    }
}

struct StatusText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom(MathForKids.fontFamily, size: 30))
            .foregroundColor(.green)
            .padding()
        
    }
    
}


