//
//  RecordingPlaybackView.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/20/24.
//
import SwiftUI

struct RecordingPlaybackView: View {
    @Environment(\.presentationMode) var presentationMode // Access presentationMode
    @State private var navigateToIntroduceYourself = false // State to trigger navigation
    @State private var navigateToColorSelection = false // State to trigger navigation

    var recordingDuration: String = "01:29" // Example duration

    var body: some View {
        NavigationView {
            VStack {
                // Navigation Bar
                HStack {
                    Button(action: {
                        // Back button action
                        presentationMode.wrappedValue.dismiss() // Go back to the previous view
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.red)
                            .font(.system(size: 18))
                    }
                    Spacer()
                    Text("Introduce Yourself")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()

                Spacer()

                // Main Prompt Text
                Text("What do you want people to know about you?")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)

                // Playback Controls
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.red.opacity(0.2))
                            .frame(width: 200, height: 200)
                    }

                    // Playback Bar
                    HStack {
                        Text(recordingDuration)
                            .font(.caption)
                            .foregroundColor(.red)
                        Spacer()
                        Image(systemName: "play.fill")
                            .foregroundColor(.red)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.1), radius: 5)
                    )
                    .padding(.horizontal, 40)
                }
                .padding(.bottom, 40)

                // Action Buttons
                HStack {
                    // Re-record Button
                    Button(action: {
                        navigateToIntroduceYourself = true // Navigate back to IntroduceYourselfView
                    }) {
                        HStack {
                            Image(systemName: "mic.fill")
                            Text("Re-record")
                                .fontWeight(.bold)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.pink.opacity(0.2))
                        .foregroundColor(.red)
                        .cornerRadius(10)
                    }

                    // Confirm Button
                    Button(action: {
                        // Navigate to Color Selection View
                        navigateToColorSelection = true
                    }) {
                        HStack {
                            Image(systemName: "checkmark")
                            Text("Confirm")
                                .fontWeight(.bold)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20)

                Spacer()

                // Navigation Links
                NavigationLink(
                    destination: IntroduceYourselfView(),
                    isActive: $navigateToIntroduceYourself
                ) {
                    EmptyView()
                }
                .hidden()

                NavigationLink(
                    destination: ColorSelectionView(),
                    isActive: $navigateToColorSelection
                ) {
                    EmptyView()
                }
                .hidden() // Hide the NavigationLink
            }
            .navigationBarBackButtonHidden(true)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(white: 1.0), Color(white: 0.95)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .navigationBarHidden(true)
    }
}

struct RecordingPlaybackView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingPlaybackView()
    }
}
