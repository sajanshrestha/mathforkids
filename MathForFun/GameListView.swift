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
    
    var body: some View {
        
        VStack {
            ForEach(CountingGame.CountingLimit.allCases) { limit in
                
                Button(action: {
                    CountingGameModel.highestCount = limit.rawValue
                    self.showCountingGameView = true
                    
                }, label: {
                    CardView(title: "Counting upto \(limit.rawValue)")
                })
                    .padding()
                
            }
        }
        .popover(isPresented: $showCountingGameView) {
            CountingGameView(game: CountingGameModel())
        }
    }
   
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}



