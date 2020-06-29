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
    @State private var nextView = false
    
    var body: some View {
        
        ZStack {
            if !nextView {
                OnboardingViewOne(name: $name, nextView: $nextView)
                    .transition(.move(edge: .leading))
            }
                
            OnboardingViewTwo(name: name).offset(x: nextView ? 0 : UIScreen.main.bounds.width)
            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
