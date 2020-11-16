//
//  AppStoreReviewManager.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 11/13/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation
import StoreKit

enum AppStoreReviewManager {
    
  static func requestReviewIfAppropriate() {
    SKStoreReviewController.requestReview()
  }
}
