//
//  ChatView.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/22/24.
// Updated by Aarnav Sangekar on 11/22/24
//
import SwiftUI

struct ChatView: View {
    @Environment(\.presentationMode) var presentationMode // For navigation
    @State private var isVoiceChatPlayed: Bool = false // Tracks whether the button has been pressed
    @State private var sentRecordings = [""]

    var body: some View {
        VStack(spacing: 0) {
            // Custom Navigation Bar
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Navigate back to the previous view
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.red)
                        .font(.system(size: 18))
                }
                Spacer()
                Text("Laurene")
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding()
            .background(Color.white)

            // Chat Messages Section
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    Image("VoiceChats")
                        .padding(.trailing, 48)
                        .frame(width: 294, height: 62)
                    Image("YourChats")
                        .padding(.leading, 48)
                        .frame(width: 294, height: 62)

                    // Sent recordings
                    ForEach(sentRecordings, id: \.self) { recording in
                        if recording != "" {
                            Image("YourChats")
                                .padding(.leading, 48)
                                .frame(width: 294, height: 62)
                        }
                    }
                }
                .padding()
            }
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.94, green: 0.92, blue: 0.91), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.96, green: 0.89, blue: 0.84), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
            )

            // Tab Bar
            Divider()
            HStack(alignment: .center, spacing: 16) {
                // Explore Tab
                NavigationLink(destination: ExploreView()) {
                    Image("ExploreTab")
                        .renderingMode(.template)
                        .foregroundColor(.gray) // Not highlighted
                }

                // Chats Tab
                Button(action: {}) {
                    Image("Chats")
                        .renderingMode(.template)
                        .foregroundColor(.red) // Highlight Chats tab
                }

                // Profile Tab
                NavigationLink(destination: ProfileView()) {
                    Image("Profile")
                        .renderingMode(.template)
                        .foregroundColor(.gray) // Not highlighted
                }
            }
            .padding(.top, 12)
            .frame(height: 99.0)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(white: 1.0), Color(white: 0.95)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .ignoresSafeArea(edges: .bottom)
        }
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.94, green: 0.92, blue: 0.91), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.96, green: 0.89, blue: 0.84), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
        )
        // Use conditional modifiers for navigation bar handling
        .modifier(ConditionalNavigationBarHidden())
        .modifier(ConditionalNavigationBarBackButtonHidden())
    }
}



struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
