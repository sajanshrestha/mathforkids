//
//  DispatchQueue.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 7/2/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

extension DispatchQueue {
    static func actionOnMain(after time: Double, action: @escaping () -> Void) {
        self.main.asyncAfter(deadline: .now() + time) {
            withAnimation(Animation.spring()) {
                action()
            }
        }
    }
}
