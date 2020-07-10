//
//  PreKHomeView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/4/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct GameListView: View {
    
    var gameList: GameList
    
    @State private var showSettingsView = false
    
    var body: some View {
        
        NavigationView {
            
            List(gameList.games) { game in
                
                NavigationLink(destination: LevelView(for: game), label: {
                    GameRow(game: game)
                })
            }
            .navigationBarTitle(Text("Math Games"))
            .navigationBarItems(
                trailing:
                Image(systemName: "person.circle")
                    .font(.title)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        self.showSettingsView = true
                }
            )
                .popover(isPresented: $showSettingsView) {
                    SettingsView()
            }
        }
    }
}

struct PreKHomeView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView(gameList: GameList())
    }
}

struct GameRow: View {
    
    let game: GameList.Game
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.blue, lineWidth: 3)
                .foregroundColor(.white)
            
            animationView(for: game.gameType)
            
            Text(game.gameType.name)
                .font(Font.custom("Noteworthy", size: textSize))
                .bold()
                .offset(y: textOffsetFactor)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
        }
    }
    
    func animationView(for gameType: GameList.GameType) -> some View {
        
        Group {
            
            
            if gameType == .counting {
                CountingAnimation()
                
            }
            if gameType == .comparing {
                ComparingAnimation()
                
            }
            if gameType == .identifyingColor {
                LottieView(filename: "colors")
            }
            
            if gameType == .identifyingShape {
                LottieView(filename: "shapes")
                
            }
            if gameType == .position {
                PositionAnimation()
                
            }
            if gameType == .classifying {
                ClassifyAnimation()
                
            }
            if gameType == .addition {
                ArithmeticAnimation(for: ArithmeticOperation.addition)
            }
            
            if gameType == .subtraction {
                ArithmeticAnimation(for: ArithmeticOperation.subtraction)
                
            }
            
            if gameType == .multiplication {
                ArithmeticAnimation(for: ArithmeticOperation.multiplication)
            }
            if gameType == .division {
                ArithmeticAnimation(for: ArithmeticOperation.division)
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



