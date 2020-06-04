//
//  PreKHomeView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/4/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct PreKHomeView: View {
    
    var games: [GameType]
    
    var body: some View {
        NavigationView {
            List(GameType.allCases) { gameType in
                NavigationLink(destination: GameListView(gameType: gameType), label: {
                    Text(gameType.rawValue)
                })
            }

        .navigationBarTitle(Text("Games"))
        }
    }
}

struct PreKHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PreKHomeView(games: [.comparing, .counting])
    }
}


enum GameType: String, CaseIterable, Identifiable {
    
    case counting = "Counting"
    case comparing = "Comparing"
    
    var id: String {
        self.rawValue
    }
    
    var itemCounts: [Int] {
        switch self {
        case .counting:
            return [3, 5, 10, 15, 20]
        case .comparing:
            return [3, 5, 10]
        }
    }
}
