//
//  PracticeEighteen.swift
//  Animations
//
//  Created by Sajan Shrestha on 6/9/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.

import SwiftUI

struct ColorAnimation: View {
    
    @State private var appear = false
    
    let colors: [UIColor] = [.blue, .purple, .orange, .systemPink, .gray, .magenta]
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                ForEach(0..<self.colors.count, id: \.self) { index in
                    Circle()
                        .stroke(Color(self.colors[index]), lineWidth: 4)
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.3, height: min(geometry.size.width, geometry.size.height) * 0.3)
                        .offset(x: self.appear ? CGFloat(index) * CGFloat(10) : 0, y: self.appear ? CGFloat(index) * CGFloat(10) : 0)

                        
                }
            
            }
            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
            .onAppear {
                self.appear = true
            }
        }
    }
    
    
    
}

struct RotatingColorAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ColorAnimation()
    }
}
