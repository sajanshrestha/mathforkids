//
//  OperationView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/24/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct OperationView: View {
    
    var firstNumber: Int
    var secondNumber: Int
    
    var operation: OperationType
    
    var body: some View {
        
        GeometryReader { geometry in
            HStack(spacing: self.spacing) {
                Image(systemName: "\(self.firstNumber).circle.fill")
                    .resizable()
                    .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
                self.symbol(for: self.operation)
                
                Image(systemName: "\(self.secondNumber).circle.fill")
                .resizable()
                .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
            }.padding()
        }
        .font(.largeTitle)
        .foregroundColor(.blue)
    }
    
    func symbol(for operation: OperationType) -> some View {
        switch operation {
        case .addition:
            return Image(systemName: "plus")
        case .subtraction:
            return Image(systemName: "minus")
        case .multiplication:
            return Image(systemName: "multiply")
        case .division:
            return Image(systemName: "divide")
        }
    }
    
    private let spacing: CGFloat = 30
}

enum OperationType {
    case addition
    case subtraction
    case multiplication
    case division
}
