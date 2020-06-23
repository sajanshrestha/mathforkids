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
                    .font(Font.custom("Noteworthy", size: self.textSize))
                    .bold()
                    .foregroundColor(self.isHigherLevel(level) ? .gray : .green)
            }).disabled(self.isHigherLevel(level))
        }
    }
    
    func isHigherLevel(_ level: Int) -> Bool {
        level > self.playerLevel.getCurrentLevel(for: self.gameType)
    }
    
    // MARK: CONSTANTS
    private let textSize: CGFloat = 28.0
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView(gameType: .comparing)
    }
}
