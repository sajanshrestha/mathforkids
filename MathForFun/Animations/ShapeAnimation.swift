//
//  ShapeAnimation.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/13/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ShapeAnimation: View {
    
    @State private var move = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                Circle()
                    .foregroundColor(.pink)
                    .padding()
                    .frame(width: self.getMinWidthOrHeight(for: geometry.size), height: self.getMinWidthOrHeight(for: geometry.size))
                    .offset(x: self.move ? -60 : 0)
                
                
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.blue)
                    .padding()
                    .frame(width: self.getMinWidthOrHeight(for: geometry.size), height: self.getMinWidthOrHeight(for: geometry.size))
                    .offset(x: self.move ? 100 : 0, y: self.move ? 80 : 0)
                
                Capsule()
                    .foregroundColor(.orange)
                    .padding()
                    .frame(width: self.getMinWidthOrHeight(for: geometry.size), height: self.getMinWidthOrHeight(for: geometry.size) / 2)
                    .offset(y: self.move ? 50 : -50)
                
                
            }.animation(Animation.linear(duration: 2).repeatCount(3, autoreverses: true))
                .onAppear {
                    self.move = true
                    
            }
        }
    }
    
    // MARK: CONSTANTS
    
    func getMinWidthOrHeight(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.3
    }
    
}

struct ShapeAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ShapeAnimation()
    }
}
