//
//  ColorSelectionView.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/20/24.
//
import SwiftUI

struct ColorSelectionView: View {
    @Environment(\.presentationMode) var presentationMode // Access presentationMode

    @State private var selectedColor: Color = .purple // Default selected color
    @State private var navigateToAllSet = false // State to navigate to the final screen
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
                Text("Add Your Color")
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding()

            Spacer()

            // Color Picker
            HStack(spacing: 16) {
                ForEach([Color.red, Color.pink, Color.orange, Color.yellow, Color.green, Color.teal, Color.blue, Color.purple], id: \.self) { color in
                    ZStack {
                        Circle()
                            .fill(color)
                            .frame(width: 50, height: 50)
                            .onTapGesture {
                                selectedColor = color
                            }

                        if selectedColor == color {
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .frame(width: 60, height: 60)
                        }
                    }
                }
            }
            .padding(.bottom, 20)

            // Playback Card
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(selectedColor.opacity(0.8))
                    .frame(height: 300)
                    .padding(.horizontal, 20)

                VStack {
                    // User Info
                    VStack {
                        Text("Hi there! I’m Laurene.")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text("When I’m not reading or writing, you’ll...")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.9))
                            .multilineTextAlignment(.center)
                    }
                    .padding(.bottom, 20)

                    // Playback Controls
                    VStack {
                        HStack {
                            Text("Laurene")
                                .font(.headline)
                                .foregroundColor(.white)
                            Spacer()
                            Text("4 hrs")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.9))
                        }
                        .padding(.horizontal, 20)

                        // Progress Bar
                        ProgressView(value: 0.1)
                            .progressViewStyle(LinearProgressViewStyle(tint: .white))
                            .padding(.horizontal, 20)
                            .padding(.top, 5)

                        // Rewind, Play/Pause, Forward
                        HStack(spacing: 40) {
                            Button(action: {
                                // Rewind action
                            }) {
                                Image(systemName: "gobackward.15")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                            }
                            Button(action: {
                                // Play/Pause action
                            }) {
                                Image(systemName: "pause.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(.white)
                            }
                            Button(action: {
                                // Forward action
                            }) {
                                Image(systemName: "goforward.15")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.top, 10)
                    }
                }
                .padding()
            }
            .padding(.bottom, 20)

            // Bottom Buttons
            HStack(spacing: 20) {
                Button(action: {
                    // Re-record action
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

                Button(action: {
                    // Confirm action for the selected color
                    navigateToAllSet = true
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
            // Navigation Link to Final Screen
            NavigationLink(
                destination: AllSetView(),
                isActive: $navigateToAllSet
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
//        .ignoresSafeArea()
    }
}

struct ColorSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectionView()
    }
}
