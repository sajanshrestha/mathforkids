//
//  AudioPlayer.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 7/3/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import AVFoundation

struct AudioPlayer {
        
    static var audioPlayer: AVAudioPlayer!
    
    static func playCorrectSound() {
        
        guard let sound = Bundle.main.path(forResource: "correct_tone", ofType: "mp3") else { return }
        
        playSound(sound)
        
    }
   
    static func playIncorrectSound() {
        
        guard let sound = Bundle.main.path(forResource: "error_tone", ofType: "mp3") else { return }
        
        playSound(sound)
    }
    
    static func playCelebrationSound() {
        
        guard let sound = Bundle.main.path(forResource: "clap", ofType: "mp3") else { return }
        
        playSound(sound)
    }
    
    private static func playSound(_ sound: String) {
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            audioPlayer.play()
            
        } catch {
            print("error playing sound")
        }
        
    }
}
