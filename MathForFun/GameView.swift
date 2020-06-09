//
//  HomeView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/3/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct GameView: View {
    
    @State private var showGameView = false
    
    var gameType: KinderGartenGameList.GameType
    
    var body: some View {
        
        
        return Group {
            
            if gameType.hasLimitSelections {
                
                self.listView(for: gameType.limitSelections!)
                    .popover(isPresented: $showGameView) {
                        self.view(for: self.gameType)
                }
            }
                
            else {
                self.view(for: gameType)
            }
        }
    }
    
    func view(for gameType: KinderGartenGameList.GameType) -> some View {
        
        GameModel.gameType = gameType
        
        return Group {
            if gameType == .counting {
                CountingGameView(game: GameModel())
            }
            else if gameType == .identifyingColor {
                ColorGameView(game: GameModel())
            }
            else if gameType == .identifyingShape {
                ShapeGameView(game: GameModel())
            }
            else if gameType == .position {
                PositionProblemGameView(game: GameModel())
            }
            else if gameType == .classifying {
                ClassifyingGameView(game: GameModel())
            }
            else if gameType == .comparing {
                ComparingGameView(game: GameModel())
            }
            else {
                Text("Game Coming Soon")
            }
        }
        
    }
    
    func listView(for selections: [Int]) -> some View {
        
        return VStack {
            
            ForEach(gameType.limitSelections!, id: \.self) { count in
                
                Button(action: {
                    
                    GameModel.highestNumberOfItems = count
                    self.showGameView = true
                    
                }, label: {
                    CardView(title: "\(self.gameType.title) upto \(count)")
                })
                    .padding()
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameType: KinderGartenGameList.GameType.comparing)
    }
}



