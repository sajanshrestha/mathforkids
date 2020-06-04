//
//  HomeView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/3/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct GameListView: View {
    
    @State private var showCountingGameView = false
    
    var gameType: GameType
        
    var body: some View {
        
        VStack {
            ForEach(gameType.itemCounts, id: \.self) { count in
                
                Button(action: {
                    CountingGameModel.highestCount = count
                    self.showCountingGameView = true
                    
                }, label: {
                    CardView(title: "\(self.gameType.rawValue) upto \(count)")
                })
                    .padding()
                
            }
        }
        .popover(isPresented: $showCountingGameView) {
            if self.gameType == .counting {
                CountingGameView(game: CountingGameModel())
            }
            else {
                ComparingGameView()
            }
        }
    }
   
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView(gameType: .comparing)
    }
}



