//
//  ChatsView.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/22/24.
// Updated by Aarnav Sangekar on 11/22/24
import SwiftUI

struct ChatListView: View {
    @Environment(\.presentationMode) var presentationMode // Access presentationMode for navigation
    @State private var selectedTab: Int = 1 // Default tab is "Chats"

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

                Text("Chats")
                    .font(.headline)
                    .foregroundColor(.black)

                Spacer()
                Spacer().frame(width: 44) // Placeholder to balance spacing
            }
            .padding()
            .background(Color.white) // Optional background for the header

            Spacer()

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    NavigationLink(destination: ChatView()) {
                        Image("Chat List")
                    }
                    Button(action: {}) {
                        Image("Chat List-1")
                    }
                    Button(action: {}) {
                        Image("Chat List-2")
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.bottom, 40)

            Spacer()

            // Footer Tab Bar with active tab styling
            Divider()
            HStack(alignment: .center, spacing: 16) {
                // Explore Tab
                NavigationLink(destination: ExploreView()) {
                    Image("ExploreTab")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 0 ? .red : .gray)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    selectedTab = 0 // Update selected tab
                })

                // Chats Tab
                Button(action: {
                    selectedTab = 1 // Update selected tab
                }) {
                    Image("Chats")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 1 ? .red : .gray)
                }

                // Profile Tab
                NavigationLink(destination: ProfileView()) {
                    Image("Profile")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 2 ? .red : .gray)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    selectedTab = 2 // Update selected tab
                })
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
            .ignoresSafeArea()
        }
        .navigationBarHidden(true) // Hide the system navigation bar
        .navigationBarBackButtonHidden(true) // Ensure the system back button is removed
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
        .onAppear {
            selectedTab = 1 // Highlight the "Chats" tab when this view appears
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
