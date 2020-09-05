//
//  RecognizingCreatureView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 9/4/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct IdentifyingObjectsGameView: View {
    
    @ObservedObject var gameSession = GameModel()
    
    @Binding var answerCorrect: Bool
    
    @Binding var levelStatus: LevelStatus
    
    @EnvironmentObject var playerLevel: PlayerLevel
    
    var level = GameModel.gameLevel
    
    var dropDelegate = TextDropDelegate()
    
    @State private var draggedEmoji = ""
    
    private var randomAlignment: Alignment {
        let alignments: [Alignment] = [.bottom, .bottomLeading, .bottomTrailing, .top, .topLeading, .topTrailing]
        return alignments.randomElement()!
    }
    
    var body: some View {
        
        let problem = gameSession.problems[gameSession.index] as! IdentifyingObjectsProblem
        
        return VStack {
            
            ScoreView(answerCorrect: self.$answerCorrect, score: self.gameSession.score)
            
            Spacer()
            
            ZStack(alignment: randomAlignment) {
                
                Image(problem.backgroundImageName)
                    .resizable()
                    .onDrop(of: ["public.text"], delegate: dropDelegate)
                
                Text(draggedEmoji)
                    .font(Font.custom("", size: 60))
            }
            
            HStack(spacing: 20) {
                
                ForEach(problem.creatures) { creature in
                    
                    Text(creature.emoji)
                        .font(Font.custom("", size: 60))
                        .onDrag { NSItemProvider(object: creature.name as NSString) }
                }
            }
            
            Text(problem.questionText)
                .modifier(QuestionText())
            
        }.onReceive(dropDelegate.$droppedText.dropFirst()) { value in
            
            withAnimation {
                self.draggedEmoji = EmojiBank.key(for: value) ?? ""
            }
            
            self.answerCorrect = self.gameSession.submitAnswer(with: value)
            
            if self.gameSession.lastProblemOn {
                DispatchQueue.actionOnMain(after: 0.5) {
                    self.levelStatus = self.playerLevel.updateLevel(for: GameModel.game, playingLevel: self.level, with: self.gameSession.score)
                }
            }
            
            DispatchQueue.actionOnMain(after: 1.0) {
                self.answerCorrect = false
                self.draggedEmoji = ""
                self.gameSession.next()
            }
        }
    }
}



class TextDropDelegate: DropDelegate {
    
    @Published var droppedText: String = ""
    
    func performDrop(info: DropInfo) -> Bool {
        
        let items = info.itemProviders(for: ["public.text"])
        
        for item in items {
            
            _ = item.loadObject(ofClass: String.self, completionHandler: { (value, error) in
                
                DispatchQueue.main.async {
                    self.droppedText = value ?? ""
                }
            })
        }
        return true
    }
    
    
}
