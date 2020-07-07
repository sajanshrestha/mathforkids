//
//  OptionsView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/9/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct OptionsView: View {
    
    let options: [String]
    let action: (String) -> Void
    
    init(options: [String], action: @escaping (String) -> Void) {
        self.options = options
        self.action = action
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack(spacing: self.spacing) {
                
                ForEach(self.options, id: \.self) { option in
                    
                    Button(action: {
                        
                        self.action(option)
                        
                    }, label: {
                        
                        Text(option)
                            .padding(self.padding)
                            .frame(width: geometry.size.width/CGFloat(self.options.count) - self.spacing)
                            .background(Color(#colorLiteral(red: 0, green: 0.9437479973, blue: 0.8790259957, alpha: 1)))
                            .cornerRadius(4)
                            .foregroundColor(.black)
                    })
                    
                }
            }
        }
    }
    
    //  MARK: CONSTANTS
    private let spacing: CGFloat = 4
    private let padding: CGFloat = 8

    
}
