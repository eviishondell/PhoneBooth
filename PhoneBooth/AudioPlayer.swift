//
//  AudioPlayer.swift
//  PhoneBooth
//
//  Created by Aarnav Sangekar on 11/28/24.
//
import Foundation
import AVFoundation
import SwiftUI
//Audio Player
//I am pretty sure theres a better way of doing this but
//This is a prototype and I am just gonna copy pase the below code
//everywhere we might have to play audio lol
//var audioPlayer : AVAudioPlayer?

struct AudioPlayer: View {
    @StateObject private var audioPlayerModel = AudioPlayerModel()
    @Binding var expandSheet: Bool
    var audioString: String
    var type: String
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomSlider(value: $audioPlayerModel.currentTime,
                         range: 0...audioPlayerModel.totalTime, set: { newValue in
                             audioPlayerModel.seekAudio(to: newValue)
                         }, trackHeight: 7)
                .frame(height: 20)
                .padding(.horizontal, 10)
            
            HStack {
                Text(audioPlayerModel.timeString(time: audioPlayerModel.currentTime))
                    .foregroundColor(.white)
                    .padding(.leading, 8)
                    .font(Font.custom("SF Pro", size: 12).weight(.semibold))
                
                Spacer()
                
                Text("-" + audioPlayerModel.timeString(time: audioPlayerModel.totalTime - audioPlayerModel.currentTime))
                    .foregroundColor(.white)
                    .padding(.trailing, 8)
                    .font(Font.custom("SF Pro", size: 12).weight(.semibold))
            }
            .padding(.bottom, 20)
            
            HStack {
                Image(systemName: "gobackward.15")
                    .resizable()
                    .frame(width: 38, height: 38, alignment: .center)
                    .foregroundColor(.white)
                    .onTapGesture {
                        audioPlayerModel.rewindSound(skipAmount: 15.00)
                    }
                
                Spacer()
                
                Image(systemName: audioPlayerModel.isPlaying ? "pause.fill" : "play.fill")
                    .resizable()
                    .frame(width: 38, height: 44)
                    .foregroundColor(.white)
                    .onTapGesture {
                        audioPlayerModel.isPlaying ? audioPlayerModel.pauseSound() : audioPlayerModel.playSound()
                    }
                    .padding(.horizontal, 60)
                
                Spacer()
                
                Image(systemName: "goforward.15")
                    .resizable()
                    .frame(width: 38, height: 38, alignment: .center)
                    .foregroundColor(.white)
                    .onTapGesture {
                        audioPlayerModel.forwardSound(skipAmount: 15.00)
                    }
            }
            .cornerRadius(12)
        }
        .onAppear {
            audioPlayerModel.setupNewSound(sound: audioString, type: type)
        }
        .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
            audioPlayerModel.updateProgress()
        }
        .onDisappear {
            audioPlayerModel.stopSound()
        }
    }
}


struct AudioPlayerPreview: PreviewProvider {
    static var previews: some View {
        let audioFiles = ["Childhood Memory", "Favourite Dish", "Ride or Die", "Proud Moment", "Life_s Motto", "First Job"]

        VStack {
                    ForEach(audioFiles.indices, id: \.self) { index in
                        AudioPlayer(expandSheet: .constant(true), audioString: audioFiles[index], type: ".m4a")
                            .padding(.horizontal, 8)
                            .onAppear {
                                print(audioFiles[index])
                            }
                    }
                }
                .background(Color.black.opacity(0.2))

        
        
    }
}
struct CustomSlider: View {
    @Binding var value: Double
    var range: ClosedRange<Double>
    var set: ((Double) -> Void)?
    var onEditingChanged: ((Bool) -> Void) = { _ in }
    var trackHeight: CGFloat = 4
    var trackColor: Color = .white.opacity(0.16)
    var progressColor: Color = .white.opacity(0.4)
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let progress = CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound))
            ZStack(alignment: .leading) {
                // Track
                Rectangle()
                    .frame(height: trackHeight)
                    .foregroundColor(trackColor)
                // Progress
                Rectangle()
                    .frame(width: progress * width, height: trackHeight)
                    .foregroundColor(progressColor)
            }
            .cornerRadius(trackHeight / 2)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { gesture in
                        let location = gesture.location.x
                        let percentage = min(max(location / width, 0), 1)
                        let newValue = Double(percentage) * (range.upperBound - range.lowerBound) + range.lowerBound
                        value = newValue
                        set?(newValue) // Call the `set` closure with the new value
                        onEditingChanged(true)
                    }
                    .onEnded { _ in
                        onEditingChanged(false)
                    }
            )
        }
        .frame(height: trackHeight)
    }
}
struct CustomSliderDemo: View {
    @State private var currentValue: Double = 0
    private let maxValue: Double = 100
    var body: some View {
        VStack {
            CustomSlider(value: $currentValue, range: 0...maxValue, trackHeight: 6, progressColor: .blue)
                .frame(height: 20)
                .padding()
            Text("Current Value: \(currentValue, specifier: "%.2f")")
                .foregroundColor(.black)
        }
    }
}

