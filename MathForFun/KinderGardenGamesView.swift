//
//  PreKHomeView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/4/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct KinderGardenGamesView: View {
    
    var gameList: KinderGardenGameList
    
    var body: some View {
        
        NavigationView {
            List(gameList.games) { game in
                NavigationLink(destination: GameView(gameType: game.gameType), label: {
                    Text(game.name)
                })
            }
        .navigationBarTitle(Text("Exercises"))
        }
    }
}

struct PreKHomeView_Previews: PreviewProvider {
    static var previews: some View {
        KinderGardenGamesView(gameList: KinderGardenGameList())
    }
}



