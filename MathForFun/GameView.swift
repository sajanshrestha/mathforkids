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
    
    var gameType: KinderGardenGameList.GameType
    
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
    
    func view(for gameType: KinderGardenGameList.GameType) -> some View {
                
        switch gameType {
            
        case .counting:
            GameModel.gameType = .counting
            
        case .identifyingColor:
            GameModel.gameType = .identifyingColor
            
        case .identifyingShape:
            GameModel.gameType = .identifyingShape
            
        case .comparing:
            GameModel.gameType = .comparing
        case .position:
            break
        case .money:
            break
        }
        
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
            else {
                ComparingGameView(game: GameModel())
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
        GameView(gameType: KinderGardenGameList.GameType.comparing)
    }
}



