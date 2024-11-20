import SwiftUI
import SwiftUI

struct IntroduceYourselfView: View {
    @Environment(\.presentationMode) var presentationMode // Access presentationMode
    @State private var isRecording = false // Tracks recording state
    @State private var navigateToPlayback = false // Tracks navigation state

    var body: some View {
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
                    .foregroundColor(isRecording ? .red : .black) // Change color when recording
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)

                // Supporting Questions
                VStack(alignment: .center, spacing: 8) {
                    Text("How to pronounce your name?")
                    Text("How do you spend your time?")
                    Text("What makes you feel alive?")
                }
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)

                Spacer()

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
                        // Stop recording and navigate to playback view
                        isRecording = false
                        navigateToPlayback = true
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

                // Navigation to Playback View
                NavigationLink(
                    destination: RecordingPlaybackView(),
                    isActive: $navigateToPlayback
                ) {
                    EmptyView()
                }
                .hidden()
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

struct IntroduceYourselfView_Previews: PreviewProvider {
    static var previews: some View {
        IntroduceYourselfView()
    }
}
