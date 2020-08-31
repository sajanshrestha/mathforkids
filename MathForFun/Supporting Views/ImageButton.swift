//
//  ImageButton.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 8/2/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ImageButton: View {
    
    var name: String
    var action: () -> Void
    
    init(named name: String, action: @escaping () -> Void) {
        self.name = name
        self.action = action
    }
    var body: some View {
        Image(systemName: name)
            .foregroundColor(.green)
            .font(.largeTitle)
            .onTapGesture {
            self.action()
        }
    }
}

struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton(named: "person") {}
    }
}
