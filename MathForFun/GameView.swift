//
//  HomeView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/3/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct GameView: View {
    
    @State private var showCountingGameView = false
    
    var gameType: KinderGardenGameList.GameType
    
    var body: some View {
                
        return Group {
            
            if gameType.limitSelections != nil {
                
                self.listView(for: gameType.limitSelections!)
                    .popover(isPresented: $showCountingGameView) {
                        
                        if self.gameType == .counting {
                            CountingGameView(countingGame: CountingGameModel())
                        }
                        else {
                            ComparingGameView()
                        }
                }
            }
                
            else {
                if gameType == .identifyingColor {
                    ColorGameView(game: IdentifyingColorGameModel())
                }
                else if gameType == .identifyingShape {
                    ShapeGameView()
                }
            }
        }
    }
    
    func listView(for selections: [Int]) -> some View {
                
        return VStack {
            
            ForEach(gameType.limitSelections!, id: \.self) { count in
                
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
        GameView(gameType: KinderGardenGameList.GameType.comparing)
    }
}



