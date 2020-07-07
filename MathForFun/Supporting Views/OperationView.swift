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
    
    var operation: ArithmeticProblem.ArithmeticOperation
    
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack(spacing: self.spacing) {
                
                CardView(title: "\(self.firstNumber)")
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.width * 0.2)
                    
                    .animation(nil)
                
                self.symbol(for: self.operation, size: geometry.size)
                    .foregroundColor(.black)
                
                CardView(title: "\(self.secondNumber)")
                    .frame(width: min(geometry.size.width, geometry.size.height) * 0.2, height: min(geometry.size.width, geometry.size.height) * 0.2)
                    .animation(nil)
                
                
            }.padding()
        }
        .font(.largeTitle)
    }
    
    func symbol(for operation: ArithmeticProblem.ArithmeticOperation, size: CGSize) -> some View {
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
