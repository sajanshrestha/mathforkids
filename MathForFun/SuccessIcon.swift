//
//  SuccessIcon.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 5/2/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct SuccessIcon: View {
    
    @Binding var success: Bool
    
    var body: some View {
        
        ZStack {
            
            Image(systemName: "checkmark.circle.fill")
                .font(.largeTitle)
                .foregroundColor(Color.green)
                .opacity(success ? 1 : 0)
                .rotationEffect(.degrees(success ? 360 : 0))
                .scaleEffect(success ? 2 : 1)
                .animation(Animation.easeInOut)
            
        }
            
    }
}

struct SuccessIcon_Previews: PreviewProvider {
    static var previews: some View {
        SuccessIcon(success: .constant(true))
    }
}
