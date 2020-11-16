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
    
    
    @State private var username = UserDefaults.getUserName() ?? ""
    
    var body: some View {
        
        NavigationView {
            
            List(gameList.games) { game in
                NavigationLink(destination: LevelView(for: game), label: {
                    GameRow(game: game)
                })
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("\(username)'s Games"))
            .navigationBarItems(
                trailing:
                ImageButton(named: "pencil.circle") {
                    self.showSettingsView = true
                }
                .font(.title)
                .foregroundColor(.blue)
                
            )
            .sheet(isPresented: $showSettingsView) {
                SettingsView(username: $username)
            }
            
            
            Text("Select a Game")
                .font(.largeTitle)
        }
        
        
    }
}

struct GameRow: View {
    
    let game: GameList.Game
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color(#colorLiteral(red: 0, green: 0.6461454034, blue: 0.5623964667, alpha: 1)), lineWidth: lineWidth)
            
            animationView(for: game)
            
            Text(game.name)
                .font(Font.custom(MathForKids.fontFamily, size: textSize))
                .bold()
                .offset(y: textOffsetFactor)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
        }
    }
    
    func animationView(for game: GameList.Game) -> some View {
        
        Group {
            
            if game == .identifyingObjects {
                LottieView(filename: "dog_two")
            }
            
            
            if game == .counting {
                LottieView(filename: "counting")
            }
            
            if game == .comparing {
                LottieView(filename: "comparing")
            }
            
            if game == .classifying {
                LottieView(filename: "classifying")
            }
            
            if game == .identifyingColor {
                LottieView(filename: "colors")
            }
            
            if game == .identifyingShape {
                LottieView(filename: "identifying_shapes")
                
            }
            if game == .position {
                LottieView(filename: "positions")
                
            }
            
            Group {
                
                if game == .addition {
                    LottieView(filename: "add")
                }
                
                if game == .subtraction {
                    LottieView(filename: "subtract")
                }
                
                if game == .multiplication {
                    LottieView(filename: "multiply")
                }
                
                if game == .division {
                    LottieView(filename: "divide")
                }
            }
        }.frame(height: height)
    }
    
    // MARK: CONSTANTS
    private let cornerRadius: CGFloat = 4
    private let lineWidth: CGFloat = 2
    private let height: CGFloat = UIScreen.main.bounds.height / 3
    private let rectangleOpacity = 0.3
    private let textSize: CGFloat = 20
    private var textOffsetFactor: CGFloat { height / 2.1 }
}



