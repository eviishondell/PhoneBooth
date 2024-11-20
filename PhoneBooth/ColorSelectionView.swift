//
//  ColorSelectionView.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/20/24.
//

import SwiftUI

struct ColorSelectionView: View {
    @State private var selectedColor: Color = .purple // Default selected color

    var body: some View {
        VStack {
            // Navigation Bar
            HStack {
                Button(action: {
                    // Back button action
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
                Spacer() // Placeholder to center the title
            }
            .padding()

            Spacer()

            // Color Picker
            HStack(spacing: 20) {
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
            .padding(.bottom, 40)

            // Playback Preview
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(selectedColor.opacity(0.8))
                        .frame(height: 200)
                        .padding(.horizontal, 20)

                    VStack {
                        Text("Hi there! I’m Laurene.")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("When I’m not reading or writing, you’ll...")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.9))
                    }
                }

                HStack {
                    Text("Laurene")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("4 hrs")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding()
                .background(selectedColor)
                .cornerRadius(12)
                .padding(.horizontal, 20)

                // Playback Controls
                HStack {
                    Text("0:19")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                    Spacer()
                    Image(systemName: "pause.fill")
                        .foregroundColor(.white)
                    Spacer()
                    Text("-2:19")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding()
                .background(selectedColor)
                .cornerRadius(12)
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 40)

            Spacer()

            // Re-record and Confirm Buttons
            HStack {
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
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(white: 1.0), Color(white: 0.95)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .ignoresSafeArea()
    }
}

struct ColorSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectionView()
    }
}
