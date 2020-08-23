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
    
    @State private var showResetAlert = false
    
    @State private var showSettingsView = false
    
    @EnvironmentObject var playerLevel: PlayerLevel
    
    var username: String {
        UserDefaults.getUserName() ?? ""
    }
    
    var body: some View {
        
        NavigationView {
            
            List(gameList.games) { game in
                
                NavigationLink(destination: LevelView(for: game), label: {
                    GameRow(game: game)
                })
            }
            .navigationBarTitle(Text("\(username)'s Games"))
            .navigationBarItems(
                leading:
                Button("Reset") {
                    self.showResetAlert = true
                },
                trailing:
                ImageButton(named: "person") {
                    self.showSettingsView = true
                }
                .font(.title)
                .foregroundColor(.blue)
                
            )
                .alert(isPresented: $showResetAlert) {
                    Alert(title: Text("Reset"), message: Text("This will reset all your levels"), primaryButton: .default(Text("Reset"), action: {
                        self.playerLevel.initialLevels()
                    }), secondaryButton: .cancel(Text("Cancel")))
            }
            .sheet(isPresented: $showSettingsView) {
                SettingsView()
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
                .stroke(Color.blue, lineWidth: lineWidth)
            
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
            
            
            if game == .counting {
                CountingAnimation()
                
            }
            if game == .comparing {
                ComparingAnimation()
                
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
            if game == .classifying {
                ClassifyAnimation()
                
            }
            if game == .addition {
                ArithmeticAnimation(for: ArithmeticOperation.addition)
            }
            
            if game == .subtraction {
                ArithmeticAnimation(for: ArithmeticOperation.subtraction)
                
            }
            
            if game == .multiplication {
                ArithmeticAnimation(for: ArithmeticOperation.multiplication)
            }
            if game == .division {
                ArithmeticAnimation(for: ArithmeticOperation.division)
            }
            
        }.frame(height: height)
    }
    
    // MARK: CONSTANTS
    private let cornerRadius: CGFloat = 10
    private let lineWidth: CGFloat = 3
    private let height: CGFloat = UIScreen.main.bounds.height / 3
    private let rectangleOpacity = 0.3
    private let textSize: CGFloat = 20
    private var textOffsetFactor: CGFloat { height / 2 }
}



