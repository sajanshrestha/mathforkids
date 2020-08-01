//
//  ShapeView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 8/1/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ShapeView: View {
    
    var shape: String
    
    var body: some View {
        GeometryReader { geometry in
            Image(self.shape)
            .resizable()
            .aspectRatio(contentMode: .fit)
                .frame(height: geometry.size.height * 0.5)
        }
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView(shape: "circle")
    }
}
