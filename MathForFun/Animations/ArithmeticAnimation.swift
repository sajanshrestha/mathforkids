//
//  AdditionAnimation.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/23/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ArithmeticAnimation: View {
    
    var operation: ArithmeticOperation
    
    init(for operation: ArithmeticOperation) {
        self.operation = operation
    }
    
    var body: some View {
        GeometryReader { geometry in
            Image(systemName: self.operatorSymbol[self.operation] ?? "plus.circle")
                .resizable()
                .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
                .foregroundColor(self.operatorColor[self.operation] ?? .green)
        }
    }
    
    private let operatorSymbol: [ArithmeticOperation: String] = [.addition: "plus.circle", .subtraction: "minus.circle", .multiplication: "multiply.circle"]
    
    private let operatorColor: [ArithmeticOperation: Color] = [.addition: .green, .subtraction: .blue, .multiplication: .purple]
}

struct ArithmeticAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ArithmeticAnimation(for: .addition)
    }
}

enum ArithmeticOperation {
    case addition
    case subtraction
    case multiplication
}
