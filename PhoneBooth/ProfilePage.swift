//
//  ViewProfile.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/22/24.
//
import SwiftUI

struct ProfilePage: View {
    @Environment(\.presentationMode) var presentationMode // Access presentationMode for navigation
    @State private var selectedTab: Int = 2 // Default tab to "Profile"

    var body: some View {
        VStack {
            // Header
            HStack {

                    Text("My Profile")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity,alignment: .center)
                    
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            
            ScrollView {
                VStack(spacing:16) {
                    // Introduction Section
                    SectionCard(
                        title: "Introduction",
                        backgroundColor: "ipod-White",
                        audioTime: "02:15",
                        description: "Hi there! I’m Laurene. When I’m not reading or writing, you’ll find me exploring new cuisines and traveling to discover hidden gems.",
                        isWhite: true
                    )
                    
                    // Travel Section
                    SectionCard(
                        title: "Travel",
                        backgroundColor: "ipod-Green",
                        audioTime: "01:09",
                        description: "I love exploring new places and learning about different cultures.",
                        isWhite: false
                    )
                    
                    // Food Section
                    SectionCard(
                        title: "Food",
                        backgroundColor: "ipod-Blue",
                        audioTime: "03:12",
                        description: "Cooking and trying out new cuisines is my passion.",
                        isWhite: false
                    )
                    
                    // Hobbies Section
                    SectionCard(
                        title: "Hobbies",
                        backgroundColor: "ipod-Purple",
                        audioTime: "03:12",
                        description: "Reading, writing, and gardening are my favorite hobbies.",
                        isWhite: false
                    )
                }
                .padding(.horizontal)
            }

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
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
        .onAppear {
            selectedTab = 2 // Highlight the "Profile" tab when this view appears
        }
    }
}


struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
