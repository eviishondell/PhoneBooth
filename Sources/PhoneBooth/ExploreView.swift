//
//  ExploreView.swift
//  PhoneBooth
//
//  Created by Aarnav Sangekar on 11/20/24.
//
import SwiftUI

struct ExploreView: View {
    @Environment(\.presentationMode) var presentationMode // Access presentationMode for navigation
    @State private var selectedColor: Color = Color(red: 0.4117647058823529, green: 0.3411764705882353, blue: 0.7137254901960784)

    let promptCards = [1, 2, 3, 4, 5, 6] // Array to generate 6 prompt cards
    let colors = ["ipod-Blue", "ipod-Green", "ipod-Orange", "ipod-Pink", "ipod-Purple", "ipod-Red"]
    let names = ["Jason", "Laurene", "David", "Ares", "Zeus", "Zagreus"]

    var body: some View {
        VStack {
            // Custom Navigation Bar
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Navigate back to the previous view
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.red)
                        .font(.system(size: 18))
                }
                .padding(.leading)

                Spacer()

                Text("Explore")
                    .font(.headline)
                    .foregroundColor(.black)

                Spacer()
                Spacer().frame(width: 44) // Placeholder to balance spacing
            }
            .padding()

            Spacer()

            // Horizontal Scroll View with Prompt Cards
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(promptCards.indices, id: \.self) { index in
                        VStack {
                            // Card Content
                            VStack {
                                Image("Transcripts")
                                    .padding(.bottom, 30)
                                VStack {
                                    HStack(alignment: .center) {
                                        VStack(alignment: .leading) {
                                            Text("\(names[index])")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            HStack(alignment: .firstTextBaseline) {
                                                Text("\(Image(systemName: "airplane")) 2 hrs")
                                                    .font(.body)
                                                    .foregroundColor(.white.opacity(0.9))
                                            }
                                        }
                                        .frame(width: 186, alignment: .topLeading)

                                        ZStack {
                                            Circle()
                                                .fill(Color.white.opacity(0.08))
                                                .frame(width: 50, height: 50)
                                            Text("1X")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(.bottom, 20)

                                    Image("Audio Progress Bar")
                                        .foregroundColor(.white)

                                    HStack {
                                        Button(action: {}) {
                                            Image(systemName: "gobackward.15")
                                                .resizable()
                                                .frame(width: 38, height: 38, alignment: .center)
                                                .foregroundColor(.white)
                                        }

                                        Spacer()

                                        Button(action: {}) {
                                            Image(systemName: "pause.fill")
                                                .resizable()
                                                .frame(width: 38, height: 44)
                                                .foregroundColor(.white)
                                        }

                                        Spacer()

                                        Button(action: {}) {
                                            Image(systemName: "goforward.15")
                                                .resizable()
                                                .frame(width: 38, height: 38, alignment: .center)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding()
                                    .cornerRadius(12)
                                    .padding(.horizontal, 20)
                                }
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 32)
                            .frame(width: 320, height: 477, alignment: .leading)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [.black.opacity(0), .black.opacity(0.16)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .background(Color(colors[index]))
                            .cornerRadius(32) // Ensures proper card rounding
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 40)

            Spacer()

            // Footer
            Divider()
            HStack(alignment: .center, spacing: 16) {
                Image("ExploreTab").tag(0)
                NavigationLink(destination: ChatListView()) {
                    Image("Chats").tag(1)
                }
                Image("Profile").tag(2)
            }
            .padding(.top, 12)
            .frame(width: 390.0, height: 99.0)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(white: 1.0), Color(white: 0.95)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .ignoresSafeArea(edges: .bottom) // Ensures the footer extends across the screen
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(white: 0.98), Color(white: 0.93)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
