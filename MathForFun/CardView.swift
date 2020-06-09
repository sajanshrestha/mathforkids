//
//  CardView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/4/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    let title: String
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.lineWidth)
                
                Color.blue.opacity(0.5)
                
                Text(self.title)
                    .font(self.title.count > 1 ? .largeTitle : Font.system(size: min(geometry.size.width, geometry.size.height) * 0.50))
                    .foregroundColor(.white)
                
            }
            .shadow(radius: 1.0)
        }
    }
    
    // MARK: DRAWING CONSTANTS
    private let cornerRadius: CGFloat = 10.0
    private let lineWidth: CGFloat = 3.0
    
}


