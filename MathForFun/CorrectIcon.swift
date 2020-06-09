//
//  SuccessIcon.swift
//  Fresh Food
//
//  Created by Sajan Shrestha on 5/2/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct CorrectIcon: View {
    
    @Binding var correct: Bool
    
    var body: some View {
        
        GeometryReader { geometry in
            Image(systemName: "checkmark.circle.fill")
                .font(Font.system(size: geometry.size.width * 0.2))
                .foregroundColor(Color.green)
                .opacity(self.correct ? 1 : 0)
                .rotationEffect(.degrees(self.correct ? 360 : 0))
                .scaleEffect(self.correct ? 2 : 1)
                .animation(Animation.easeInOut)
        }
        
        
        
    }
}

struct CorrectIcon_Previews: PreviewProvider {
    static var previews: some View {
        CorrectIcon(correct: .constant(true))
    }
}
