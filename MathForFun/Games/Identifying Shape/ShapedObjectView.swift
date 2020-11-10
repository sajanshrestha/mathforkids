//
//  ImageCardView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 11/10/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ShapedObjectView: View {
    
    var shapedObject: ShapedObjectProblem.ShapedObject
    var action: (String) -> Void
    
    var body: some View {
        Image(shapedObject.image)
            .resizable()
            .onTapGesture {
                action(shapedObject.shape.rawValue)
            }
    }
}
