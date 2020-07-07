//
//  Publishers and Notifications .swift
//  MathForFun
//
//  Created by Sajan Shrestha on 7/6/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import UIKit
import Combine

extension Publishers {
    
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}
