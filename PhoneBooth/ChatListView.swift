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

            Divider()
            
            HStack(alignment: .center, spacing: 90) { // Increase spacing between icons
                // Explore Tab
                NavigationLink(destination: ExploreView()) {
                    VStack {
                        Image(systemName: "globe") // SF Symbol for "Explore"
                            .resizable() // Make the icon resizable
                            .scaledToFit() // Maintain aspect ratio
                            .frame(width: 35, height: 35) // Make the icon bigger
                            .foregroundColor(selectedTab == 0 ? .red : .gray)

                        Text("Explore") // Text under the icon
                            .font(.caption)
                            .foregroundColor(selectedTab == 0 ? .red : .gray)
                    }
                }
                .simultaneousGesture(TapGesture().onEnded {
                    selectedTab = 0
                })

                // Chats Tab
                NavigationLink(destination: ChatListView()) {
                    VStack {
                        Image(systemName: "message.fill") // SF Symbol for "Chats"
                            .resizable() // Make the icon resizable
                            .scaledToFit() // Maintain aspect ratio
                            .frame(width: 35, height: 35) // Make the icon bigger
                            .foregroundColor(selectedTab == 1 ? .red : .gray)

                        Text("Chats") // Text under the icon
                            .font(.caption)
                            .foregroundColor(selectedTab == 1 ? .red : .gray)
                    }
                }
                .simultaneousGesture(TapGesture().onEnded {
                    selectedTab = 1
                })
                
                // Profile Tab
                Button(action: {
                    selectedTab = 2 // Ensure "Profile" stays selected
                }) {
                    VStack {
                        Image(systemName: "person.fill") // SF Symbol for "Profile"
                            .resizable() // Make the icon resizable
                            .scaledToFit() // Maintain aspect ratio
                            .frame(width: 35, height: 35) // Make the icon bigger
                            .foregroundColor(selectedTab == 2 ? .red : .gray)

                        Text("Profile") // Text under the icon
                            .font(.caption)
                            .foregroundColor(selectedTab == 2 ? .red : .gray)
                    }
                }
            }
            .padding(.top, 12)
            .frame(height: 55.0)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.clear, Color.clear]), // Transparent background
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .ignoresSafeArea()

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
        .navigationBarHidden(true) // Hide the system navigation bar
        .navigationBarBackButtonHidden(true) // Ensure the system back button is removed
//        .background(
//            LinearGradient(
//                stops: [
//                    Gradient.Stop(color: Color(red: 0.94, green: 0.92, blue: 0.91), location: 0.00),
//                    Gradient.Stop(color: Color(red: 0.96, green: 0.89, blue: 0.84), location: 1.00),
//                ],
//                startPoint: UnitPoint(x: 0.5, y: 0),
//                endPoint: UnitPoint(x: 0.5, y: 1)
//            )
//        )
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
