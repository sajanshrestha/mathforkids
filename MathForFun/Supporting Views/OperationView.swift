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
                Image(systemName: "\(self.firstNumber).circle.fill")
                    .resizable()
                    .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
                
                self.symbol(for: self.operation, size: geometry.size)

                Image(systemName: "\(self.secondNumber).circle.fill")
                .resizable()
                .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
            }.padding()
        }
        .font(.largeTitle)
        .foregroundColor(.blue)
    }
    
    func symbol(for operation: ArithmeticProblem.ArithmeticOperation, size: CGSize) -> some View {
        switch operation {
        case .addition:
            return Image(systemName: "plus")
                .resizable()
                .frame(width: size.width * 0.2, height: size.width * 0.15)
        case .subtraction:
            return Image(systemName: "minus")
                .resizable()
                .frame(width: size.width * 0.15, height: 10)
        case .multiplication:
            return Image(systemName: "multiply")
                .resizable()
                .frame(width: size.width * 0.1, height: size.width * 0.1)
        case .division:
            return Image(systemName: "divide")
                .resizable()
                .frame(width: size.width * 0.1, height: size.width * 0.1)
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
