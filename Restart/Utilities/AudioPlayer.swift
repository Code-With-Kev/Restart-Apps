//
//  AudioPlayer.swift
//  Restart
//
//  Created by Kevni Woodside on 4/10/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    //Path property used to point out any sound file in the application
    //Returns full path name for resource
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not play the sound file.")
        }
    }
}



// Make sure this is a SwiftUI File not SwiftUI View

// AV Foundation is a framework for working with time based audiovisual media. Allows you to easily play, create, and edit movies, sound files and build powerful media functionality into any apps using this framework.

