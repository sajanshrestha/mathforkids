//
//  PreKHomeView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/4/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct KinderGartenGamesView: View {
    
    var gameList: KinderGartenGameList
    
    var body: some View {
        
        NavigationView {
            
            List(gameList.games) { game in
                
                NavigationLink(destination: GameView(gameType: game.gameType), label: {
                    GameRow(game: game)
                })
            }
            .navigationBarTitle(Text("Pre Kindergarten Exercises"), displayMode: .inline)
        }
    }
}

struct PreKHomeView_Previews: PreviewProvider {
    static var previews: some View {
        KinderGartenGamesView(gameList: KinderGartenGameList())
    }
}

struct GameRow: View {
    
    let game: KinderGartenGameList.Game
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(height: height)
                .foregroundColor(.red).opacity(rectangleOpacity)
            
            animationView(for: game.gameType)
            
            Text(game.gameType.name)
                .font(Font.custom("Noteworthy", size: textSize))
                .bold()
                .foregroundColor(.black)
                .offset(y: textOffsetFactor)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
        }
    }
    
    func animationView(for gameType: KinderGartenGameList.GameType) -> some View {
        Group {
            
            if gameType == .counting {
                CountingAnimation()
                
            }
            if gameType == .comparing {
                ComparingAnimation()
                
            }
            if gameType == .identifyingColor {
                ColorAnimation()
                
            }
            
            if gameType == .identifyingShape {
                ShapeAnimation()
                
            }
            if gameType == .position {
                PositionAnimation()
                
            }
            if gameType == .classifying {
                ClassifyAnimation()
                
            }
        }.frame(height: height)
    }
    
    // MARK: CONSTANTS
    private let cornerRadius: CGFloat = 10
    private let height: CGFloat = UIScreen.main.bounds.height / 3
    private let rectangleOpacity = 0.3
    private let textSize: CGFloat = 20
    private var textOffsetFactor: CGFloat { height / 2 }
}



