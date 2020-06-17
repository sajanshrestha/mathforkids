//
//  PositionAnimation.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/14/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct PositionAnimation: View {
    
    @State private var expand = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.red)
                .frame(width: width, height: height)
                .overlay(Text("Middle").opacity(expand ? 1 : 0))
                
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.pink)
                .frame(width: width, height: height)
                .offset(y: expand ? offsetFactor : 0)
                .overlay(Text("Bottom").opacity(expand ? 1 : 0).offset(y: expand ? offsetFactor : 0))
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.orange)
                .frame(width: width, height: height)
                .offset(y: expand ? -offsetFactor : 0)
                .overlay(Text("Top").opacity(expand ? 1 : 0).offset(y: expand ? -offsetFactor : 0))
            
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.purple)
                .frame(width: width, height: height)
                .offset(x: expand ? -offsetFactor : 0)
                .overlay(Text("Left").opacity(expand ? 1 : 0).offset(x: expand ? -offsetFactor : 0))
            
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.yellow)
                .frame(width: width, height: height)
                .offset(x: expand ? offsetFactor : 0)
                .overlay(Text("Right").opacity(expand ? 1 : 0).offset(x: expand ? offsetFactor : 0))
            
        }
        .opacity(0.6)
        .foregroundColor(.black)
        .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
        .onAppear {
                self.expand = true
        }
    }
    
    // MARK: CONSTANTS
    
    private let width: CGFloat = 70
    private let height: CGFloat = 70
    private let cornerRadius: CGFloat = 10.0
    private let offsetFactor: CGFloat = 100
}

struct PositionAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PositionAnimation()
    }
}
