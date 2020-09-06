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
    @State private var draggedEmojiLocation = CGPoint.zero
    
    private var randomAlignment: Alignment {
        let alignments: [Alignment] = [.bottom, .bottomLeading, .bottomTrailing, .top, .topLeading, .topTrailing]
        return alignments.randomElement()!
    }
    
    var body: some View {
        
        let problem = gameSession.problems[gameSession.index] as! IdentifyingObjectProblem
        
        return VStack {
            
            ScoreView(answerCorrect: self.$answerCorrect, score: self.gameSession.score)
            
            Spacer()
            
            GeometryReader { geometry in
                ZStack(alignment: self.randomAlignment) {
                    
                    Image(problem.backgroundImageName)
                        .resizable()
                        .saturation(0.7)
                        .onDrop(of: ["public.text"], delegate: self.dropDelegate)
                    
                    Text(self.draggedEmoji)
                        .font(Font.custom("", size: 60))
                        .position(CGPoint(x: self.draggedEmojiLocation.x, y: geometry.convert(self.draggedEmojiLocation, from: .global).y))
                    
                }
            }
            
            HStack(spacing: 20) {
                
                ForEach(problem.options) { creature in
                    
                    Text(creature.emoji)
                        .font(Font.custom("", size: 60))
                        .onDrag { NSItemProvider(object: creature.name as NSString) }
                }
            }
            
            Text(problem.questionText)
                .modifier(QuestionText())
            
        }.onReceive(dropDelegate.$droppedText.dropFirst()) { value in
            
            withAnimation {
                self.draggedEmoji = EmojiBank.IdentifyingObjects.key(for: value) ?? ""
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
        .onReceive(dropDelegate.$location) { value in
            self.draggedEmojiLocation = value
        }
    }
}



class TextDropDelegate: DropDelegate {
    
    @Published var droppedText: String = ""
    @Published var location: CGPoint = CGPoint.zero
    
    func performDrop(info: DropInfo) -> Bool {
        
        let items = info.itemProviders(for: ["public.text"])
        
        
        for item in items {
            
            _ = item.loadObject(ofClass: String.self, completionHandler: { (value, error) in
                
                DispatchQueue.main.async {
                    self.droppedText = value ?? ""
                    self.location = info.location
                }
            })
        }
        return true
    }
    
    
}


extension GeometryProxy {
    // converts from some other coordinate space to the proxy's own
    func convert(_ point: CGPoint, from coordinateSpace: CoordinateSpace) -> CGPoint {
        let frame = self.frame(in: coordinateSpace)
        return CGPoint(x: point.x-frame.origin.x, y: point.y-frame.origin.y)
    }
}
