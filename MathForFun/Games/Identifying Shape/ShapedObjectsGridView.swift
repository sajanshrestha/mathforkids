//
//  TappableImagesView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 11/10/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

import SwiftUI

struct ShapedObjectsGridView: View {
    
    let shapedObjects: [ShapedObjectProblem.ShapedObject]
    var action: (String) -> Void
    
    var body: some View {
        
        Group {
            
            VStack(spacing: self.spacing) {
                
                HStack {
                    ShapedObjectView(shapedObject: shapedObjects[0], action: action)
                    ShapedObjectView(shapedObject: shapedObjects[1], action: action)
                }
                HStack {
                    ShapedObjectView(shapedObject: shapedObjects[2], action: action)
                    ShapedObjectView(shapedObject: shapedObjects[3], action: action)
                }
            }.padding()
        }
    }
    
    //MARK:- constants
    private let spacing: CGFloat = 4
}
