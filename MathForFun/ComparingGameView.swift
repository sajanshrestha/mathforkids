//
//  ComparingGameView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/4/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct ComparingGameView: View {
    
    let setOne = [
        EmojiView(id: 1, emoji: "🦌"),
        EmojiView(id: 2, emoji: "🦌"),
    ]
    
    let setTwo = [
        EmojiView(id: 1, emoji: "🦛"),
        EmojiView(id: 2, emoji: "🦛"),
        EmojiView(id: 3, emoji: "🦛"),
        EmojiView(id: 4, emoji: "🦛"),
        EmojiView(id: 5, emoji: "🦛")

    ]
    
    var body: some View {
        
        
        GeometryReader { geometry in
            VStack(spacing: 30) {
                Grid(self.setOne) { emojiView in
                    CardView(title: emojiView.emoji).padding()
                }
                .border(Color.green, width: 4)
                .onTapGesture {
                    // do some
                }
                
                Grid(self.setTwo) { emojiView in
                    CardView(title: emojiView.emoji).padding()
                }.border(Color.green, width: 4)
                .onTapGesture {
                    // do some
                }
                
            }
            .padding()
            .frame(height: geometry.size.height * 0.75)
        }
        
    }
}

struct ComparingGameView_Previews: PreviewProvider {
    static var previews: some View {
        ComparingGameView()
    }
}
