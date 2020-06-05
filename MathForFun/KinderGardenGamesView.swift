//
//  PreKHomeView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/4/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct KinderGardenGamesView: View {
    
    var gameTypes: [KinderGardenGameType]
    
    var body: some View {
        
        NavigationView {
            List(KinderGardenGameType.allCases) { gameType in
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
        KinderGardenGamesView(gameTypes: [.comparing, .counting])
    }
}



