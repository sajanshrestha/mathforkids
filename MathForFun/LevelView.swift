//
//  LevelView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct LevelView: View {
    
    var gameType: GameList.GameType
    
    @EnvironmentObject var playerLevel: PlayerLevel
    
    var body: some View {
        List(1...gameType.numberOfLevels, id: \.self) { level in
            NavigationLink(destination: GameView(gameType: self.gameType, level: level), label: {
                Text("Level \(level)")
            }).disabled(self.isHigherLevel(level))
        }
    }
    
    func isHigherLevel(_ level: Int) -> Bool {
        level > self.playerLevel.getCurrentLevel(for: self.gameType)
    }
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView(gameType: .comparing)
    }
}
