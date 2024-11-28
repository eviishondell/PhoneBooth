//
//  AudioPlayerModel.swift
//  PhoneBooth
//
//  Created by Aarnav Sangekar on 11/28/24.
//


import Foundation
import AVFoundation
import SwiftUI

class AudioPlayerModel: ObservableObject {
    @Published var audioPlayer: AVAudioPlayer?
    @Published var totalTime: TimeInterval = 0.0
    @Published var currentTime: TimeInterval = 0.0
    @Published var isPlaying: Bool = false
    
    func setupNewSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                print(audioPlayer.debugDescription)
                audioPlayer?.prepareToPlay()
                totalTime = audioPlayer?.duration ?? 0.0
            } catch {
                print("Could not find and play audio file due to error: \(error)")
            }
        }
    }
    
    func playSound() {
        if totalTime == 0.0 {
            setupNewSound(sound: "audioFileName", type: "m4a")
        }
        audioPlayer?.play()
        isPlaying = true
    }
    
    func pauseSound() {
        audioPlayer?.pause()
        isPlaying = false
    }
    
    func stopSound() {
        audioPlayer?.stop()
        isPlaying = false
    }
    
    func forwardSound(skipAmount: Double) {
        audioPlayer?.currentTime += skipAmount
    }
    
    func rewindSound(skipAmount: Double) {
        audioPlayer?.currentTime -= skipAmount
    }
    
    func updateProgress() {
        guard let player = audioPlayer else { return }
        currentTime = player.currentTime
    }
    
    func seekAudio(to time: TimeInterval) {
        audioPlayer?.currentTime = time
    }
    
    func timeString(time: TimeInterval) -> String {
        let minute = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%01d:%02d", minute, seconds)
    }
}
