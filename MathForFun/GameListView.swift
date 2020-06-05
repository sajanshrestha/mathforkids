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
    
    var gameType: KinderGardenGameType
        
    var body: some View {
                
        return Group {
            
            if gameType.itemCounts != nil {
                
                listView(for: gameType.itemCounts!)
                    .popover(isPresented: $showCountingGameView) {
                    
                    if self.gameType == .counting {
                        CountingGameView(game: CountingGameModel())
                    }
                    else {
                        ComparingGameView()
                    }
                }
            }
            else {
                if gameType == .identifyingColors {
                    ColorGameView(game: IdentifyingColorGameModel())
                }
                else {
                    ShapeGameView()
                }
            }
        }
    }
    
    func listView(for itemListCount: [Int]) -> some View {
        VStack {
            
            ForEach(gameType.itemCounts!, id: \.self) { count in
                
                Button(action: {
                    self.setHighestCountForGames(count: count)
                    self.showCountingGameView = true
                    
                }, label: {
                    CardView(title: "\(self.gameType.rawValue) upto \(count)")
                })
                    .padding()
                
            }
        }
    }
    
    
    func setHighestCountForGames(count: Int) {
        CountingGameModel.highestCount = count
    }
   
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView(gameType: .comparing)
    }
}



