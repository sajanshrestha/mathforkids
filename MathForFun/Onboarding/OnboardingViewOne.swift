//
//  OnboardingViewOne.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/29/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

/*
----------------------------------------------------------------
this view asks user to enter a user name which will be used throughout
the app!
----------------------------------------------------------------
*/


import SwiftUI

struct OnboardingViewOne: View {
    
    @Binding var name: String
    @Binding var nextView: Bool
    
    var body: some View {
                
        VStack {
            Image("babyOne")
                .resizable()
                .frame(width: 200, height: 300)
            
            Text("Please enter you name to get started")
                .font(.custom("Noteworthy", size: 24))
                
            
            TextField("", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: {
                
                guard !self.name.isEmpty else { return }
                
                withAnimation(Animation.spring()) {
                    
                    UserDefaults.standard.set(self.name, forKey: "user_name")

                    self.nextView = true
                    
                }
                
            }, label: {
                Text("Next")
                    .font(.title)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            })
            
        }
    }
}

struct OnboardingViewOne_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewOne(name: .constant(""), nextView: .constant(false))
    }
}
