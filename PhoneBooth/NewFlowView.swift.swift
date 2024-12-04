//
//  NewFlowView.swift.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 12/4/24.
//
//  NewFlowView.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 12/4/24.
//
import SwiftUI

struct NewFlowView: View {
    @Environment(\.presentationMode) var presentationMode // Access presentationMode
    @State private var isRecording = false // Tracks recording state
    @State private var showPlayback = false // Tracks if playback screen is displayed
    @State private var recordingDuration = "00:00" // Recording duration placeholder
    @State private var navigateToPlayback = false // Tracks navigation state
    @State private var showText = true // Controls visibility of the text
    @State private var showPrompt = false // Controls visibility of the prompt

    var body: some View {
        VStack {
            // Navigation Bar
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Go back to the previous view
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.red)
                        .font(.system(size: 18))
                }
                Spacer()
                Text("Today's Prompt")
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding()

            Spacer()

            // Display the text for 5 seconds and then show the prompt
            if showText {
                Text("Welcome, take a moment to reflect.")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    .onAppear {
                        // Wait for 5 seconds, then hide the text and show the prompt
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showText = false
                            showPrompt = true
                        }
                    }
            }

            // Display the prompt after the text disappears
            if showPrompt {
                Text("What makes you feel completely alive?")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
            }

            Spacer()

            // Playback or Recording UI
            if showPlayback {
                VStack {
                    // Snippet with Play Button
                    HStack(spacing: 10) {
                        Text(recordingDuration)
                            .font(.caption)
                            .foregroundColor(.red)

                        Spacer()

                        Button(action: {
                            // Play recording action
                        }) {
                            Image(systemName: "play.fill")
                                .foregroundColor(.red)
                                .font(.system(size: 18))
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.1), radius: 5)
                    )
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20)

                    // Re-record and Confirm Buttons
                    HStack(spacing: 16) {
                        Button(action: {
                            // Re-record action
                            isRecording = false
                            showPlayback = false
                            recordingDuration = "00:00"
                        }) {
                            Text("Re-record")
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.red.opacity(0.2))
                                .cornerRadius(10)
                        }

                        // **Confirm Button that navigates to next page**
                        NavigationLink(
                            destination: RecordingComplete(), // Navigate to ExploreView
                            isActive: $navigateToPlayback
                        ) {
                            Button(action: {
                                // Confirm action and navigate
                                navigateToPlayback = true
                            }) {
                                Text("Confirm")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.red)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal, 40)
                }
            } else {
                // Animated Recording Visual
                ZStack {
                    if isRecording {
                        Circle()
                            .fill(Color.red.opacity(0.3))
                            .frame(width: 200, height: 200)
                            .scaleEffect(isRecording ? 1.2 : 1.0)
                            .animation(
                                Animation.easeInOut(duration: 1).repeatForever(autoreverses: true),
                                value: isRecording
                            )
                    }

                    Circle()
                        .fill(isRecording ? Color.red : Color.red.opacity(0.2))
                        .frame(width: 50, height: 50)
                }
                .frame(width: 300, height: 300)
                .padding(.bottom, 40)

                // Record/Stop Button
                Button(action: {
                    if isRecording {
                        // Stop recording and show playback UI
                        isRecording = false
                        showPlayback = true
                        recordingDuration = "01:29" // Example duration
                    } else {
                        // Start recording
                        isRecording.toggle()
                    }
                }) {
                    HStack {
                        Image(systemName: isRecording ? "stop.fill" : "mic.fill") // Toggle icon
                            .font(.system(size: 18))
                        Text(isRecording ? "Stop Recording" : "Record") // Toggle label
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
            }

            Spacer()
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
}

struct NewFlowView_Previews: PreviewProvider {
    static var previews: some View {
        NewFlowView()
    }
}

