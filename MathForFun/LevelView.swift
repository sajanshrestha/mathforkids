//  LevelView.swift
//  MathForFun

/*
----------------------------------------------------------------
this view displays all the available levels for a selected game

initially, only Level One will be unlocked but the player can get a good
score (8 or above) and unlock the next level.

For any game, only the levels that are unlocked will appear green
----------------------------------------------------------------
*/

//  Created by Sajan Shrestha on 6/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.


import SwiftUI
 
struct LevelView: View {
    
    var game: GameList.Game
    
    @State private var showResetAlert = false
    
    @EnvironmentObject var playerLevel: PlayerLevel
    
    init(for game: GameList.Game) {
        self.game = game
    }
    
    var body: some View {
        
        let numberOfLevels = self.game.numberOfLevels
        
        return List(1...numberOfLevels, id: \.self) { currentLevel in
            
            self.view(for: currentLevel)
            
        }
            .navigationBarTitle(game.name)
            .navigationBarItems(trailing:
                Button("Reset") {
                    self.showResetAlert = true
            })
            .alert(isPresented: $showResetAlert) {
                    Alert(title: Text("Reset"), message: Text("This will reset all your levels"), primaryButton: .default(Text("Reset"), action: {
                        withAnimation(Animation.easeInOut) {
                            self.playerLevel.resetLevel(for: self.game)
                        }
                    }), secondaryButton: .cancel(Text("Cancel")))
            }
    }
    
    private func view(for currentLevel: Int) -> some View {
        
        NavigationLink(destination: GameView(for: game, in: currentLevel) , label: {
            
            HStack {
                
                LevelRow(level: currentLevel)
                    .opacity(isHigherLevel(currentLevel) ? 0.2 : 1)
                
                Spacer()
                Image(systemName: isHigherLevel(currentLevel) ? "lock.fill" : "lock.open.fill").font(.headline).foregroundColor(.red)

            }

        }).disabled(isHigherLevel(currentLevel))
    }
    
    func isHigherLevel(_ level: Int) -> Bool {
        level > self.playerLevel.getCurrentLevel(for: self.game)
    }
    
    // MARK: CONSTANTS
    private let textSize: CGFloat = 28.0
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView(for: GameList.Game.addition)
    }
}

