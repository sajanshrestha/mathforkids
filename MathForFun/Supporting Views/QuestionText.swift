//
//  QuestionText.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/24/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI


struct QuestionText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom(MathForKids.fontFamily, size: textSize))
            .padding(padding)
            .animation(nil)
    }
    
    // MARK: CONSTANTS
    
    private let textSize: CGFloat = 32
    private let padding: CGFloat = 20
    
}
