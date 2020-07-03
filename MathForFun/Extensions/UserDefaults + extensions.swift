//
//  UserDefaults + extensions.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 7/2/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    private static let USERNAME_KEY = "user_name"
    private static let PLAYER_LEVEL_KEY = "player_level"
    
    static func updateUserName(with username: String) {
        UserDefaults.standard.setValue(username, forKey: UserDefaults.USERNAME_KEY)
    }
    
    static func getUserName() -> String {
        UserDefaults.standard.value(forKey: UserDefaults.USERNAME_KEY) as! String
    }
    
    static func updatePlayerLevel(with currentLevels: [String: Int]) {
        UserDefaults.standard.set(currentLevels, forKey: "PlayerLevel")
    }
    
    static func getPlayerLevel() -> [String: Int]? {
        UserDefaults.standard.value(forKey: "PlayerLevel") as? [String: Int]
    }
    
}
