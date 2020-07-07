//
//  CountingAnimation.swift
//  Animations
//
//  Created by Sajan Shrestha on 6/13/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct CountingAnimation: View {
    
    @State private var move = false
    
    var imageNames = ["1.circle", "2.circle", "3.circle"]
    
    private var randomOffsetValues: [CGFloat] {
        Array.init(repeating: CGFloat(Int.random(in: 5...30)), count: imageNames.count)
    }
    
    private var randomColors: [UIColor] {
        let colorList: [UIColor] = [.blue, .orange, .yellow, .red, .purple, .systemPink, .cyan, .darkGray, .brown, .green, .magenta]
        return colorList.randomElements(imageNames.count)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack {
                
                ForEach(self.imageNames.indices, id: \.self) { index in
                    
                    Image(systemName: self.imageNames[index])
                        .offset(x: 0, y: self.move ? self.randomOffsetValues[index] : -self.randomOffsetValues[index])
                        .foregroundColor(Color(self.randomColors[index]))
                }
                
            }
            .shadow(radius: self.radius)
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) / CGFloat(self.imageNames.count + 1)))
            .animation(Animation.linear(duration: 1).repeatCount(3, autoreverses: true))
            .onAppear {
                self.move.toggle()
            }
        }
    }
    
    // MARK: CONSTANTS
    private let radius: CGFloat = 5.0
    
}

struct CountingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CountingAnimation(imageNames: ["1.circle", "2.circle", "3.circle", "4.circle"])
            .frame(width: 200, height: 200)
    }
}


