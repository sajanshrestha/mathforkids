//
//  OnboardingViewTwo.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/29/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct OnboardingViewTwo: View {
    
    var name: String
    
    @State private var showGameView = false
    
    var body: some View {
        
        Group {
            if !showGameView {
                
                VStack {
                    
                    Image("babyTwo")
                        .resizable()
                        .frame(width: 200, height: 300)
                    
                    Text("Hi \(name), have fun playing all the games and learning along the way")
                        .font(.custom("Noteworthy", size: 24))
                        .padding()
                    
                    Button(action: {
                        
                        self.showGameView = true
                        
                    }, label: {
                        Text("Get Started")
                            .font(.title)
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    })
                    
                }
                .padding(.horizontal)
                .transition(.scale)
            }
            else {
                GamesView(gameList: GameList()).environmentObject(PlayerLevel())
            }
            
            
        }

    }
}

struct OnboardingViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewTwo(name: "Aayam")
    }
}
