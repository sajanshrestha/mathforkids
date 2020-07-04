//
//  OnboardingView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/29/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var name = ""
    @State private var secondScreen = false
    
    var body: some View {
        
        ZStack {
            if !secondScreen {
                FirstScreenView(name: $name, secondScreen: $secondScreen)
                    .transition(.move(edge: .leading))
            }
            
            SecondScreenView(name: name).offset(x: secondScreen ? 0 : UIScreen.main.bounds.width)
        }
    }
}

struct FirstScreenView: View {
    
    @Binding var name: String
    @Binding var secondScreen: Bool
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image(imageOne)
                .resizable()
                .frame(width: imageWidth, height: imageHeight)
            
            Text("Please enter you name to get started")
                .font(.custom(fontFamily, size: textSize))
            
            
            TextField("", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                
                self.showSecondScreen()
                
            }, label: {
                Text("Next")
                    .font(.title)
            })
        }
    }
    
    private func showSecondScreen() {
        
        guard !name.isEmpty else { return }
        
        withAnimation(Animation.spring()) {
            
            UserDefaults.updateUserName(with: name)
            
            self.secondScreen = true
            
        }
    }
}

struct SecondScreenView: View {
    
    var name: String
    
    @State private var showGameView = false
    
    var body: some View {
        
        Group {
            
            if !showGameView {
                
                VStack {
                    
                    Spacer()
                    
                    Image(imageTwo)
                        .resizable()
                        .frame(width: imageWidth, height: imageHeight)
                    
                    VStack(spacing: spacing) {
                        Text("Hi \(name)").bold().foregroundColor(.green)
                        Text("Have fun playing all the games and learning along the way")
                        
                    }
                    .font(.custom(fontFamily, size: textSize))
                    .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(Animation.spring()) {
                            self.showGameView = true
                        }
                        
                    }, label: {
                        Text("Get Started")
                            .font(.title)
                        
                    })
                }
                .padding(.horizontal)
                .transition(.scale)
            }
            else {
                
                GamesView(gameList: GameList()).environmentObject(PlayerLevel())
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


// MARK: CONSTANTS

fileprivate let imageOne = "babyOne"
fileprivate let imageTwo = "babyTwo"

fileprivate let fontFamily = "Noteworthy"

fileprivate let imageWidth: CGFloat = 200
fileprivate let imageHeight: CGFloat = 300
fileprivate let textSize: CGFloat = 24
fileprivate let spacing: CGFloat = 10
