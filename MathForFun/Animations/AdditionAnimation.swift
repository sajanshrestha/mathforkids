//
//  AdditionAnimation.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/23/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct AdditionAnimation: View {
    var body: some View {
        GeometryReader { geometry in
            Image(systemName: "plus.circle")
                .resizable()
                .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
                .foregroundColor(.green)
        }
    }
}

struct AdditionAnimation_Previews: PreviewProvider {
    static var previews: some View {
        AdditionAnimation()
    }
}


struct SubtractionAnimation: View {
    var body: some View {
        GeometryReader { geometry in
            Image(systemName: "minus.circle")
                .resizable()
                .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
                .foregroundColor(.blue)
        }
    }
}

struct SubtractionAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionAnimation()
    }
}


struct MultiplicationAnimation: View {
    var body: some View {
        GeometryReader { geometry in
            Image(systemName: "multiply.circle")
                .resizable()
                .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3)
                .foregroundColor(.purple)
        }
    }
}

struct MultiplicationAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionAnimation()
    }
}
