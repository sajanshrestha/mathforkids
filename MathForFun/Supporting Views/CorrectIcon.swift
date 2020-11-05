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
    
    var color: UIColor = .green
    
    var body: some View {
        
        Image(systemName: "checkmark.circle.fill")
            .font(Font.system(size: 50))
            .foregroundColor(Color(self.color))
            .opacity(self.correct ? 1 : 0)
            .rotationEffect(.degrees(self.correct ? 360 : 0))
            .scaleEffect(self.correct ? 2 : 1)
            .animation(Animation.easeInOut)
    }
}

struct CorrectIcon_Previews: PreviewProvider {
    static var previews: some View {
        CorrectIcon(correct: .constant(true), color: UIColor.green)
    }
}
