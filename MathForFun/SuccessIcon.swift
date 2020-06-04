//
//  SuccessIcon.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 5/2/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct SuccessIcon: View {
    
    @Binding var correct: Bool
    
    var body: some View {
        
        ZStack {
            
            
            Text("👏🏻")
            
                .font(Font.system(size: 100))
                .opacity(correct ? 1 : 0)
                .offset(x: 0, y: 10)
                .rotationEffect(.degrees(correct ? 2*360 : 0))
                .animation(Animation.easeInOut(duration: 1.0))
        }
        
    }
}

struct SuccessIcon_Previews: PreviewProvider {
    static var previews: some View {
        SuccessIcon(correct: .constant(true))
    }
}
