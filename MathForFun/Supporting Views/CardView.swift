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
                
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .fill(Color(#colorLiteral(red: 0, green: 0.9437479973, blue: 0.8790259957, alpha: 1)))
                
                Text(self.title)
                    .font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.50))
                    .foregroundColor(.black)
                
            }
            .shadow(radius: 1.0)
        }
    }
    
    // MARK: DRAWING CONSTANTS
    private let cornerRadius: CGFloat = 10.0
    private let lineWidth: CGFloat = 3.0
    
}


