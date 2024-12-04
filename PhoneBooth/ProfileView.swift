//
//  ViewProfile.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/22/24.
//
import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode // Access presentationMode for navigation
    @State private var selectedTab: Int = 2 // Default tab to "Profile"

    var body: some View {
        VStack {
            // Header
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Navigate back to the previous view
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.red)
                        .font(.system(size: 18))
                }
                .frame(width: 50, alignment: .leading)
//                Spacer()
                VStack {
                    Text("Laurene")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("Female, 50 y.o.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 5)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 75)
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            
            ScrollView {
                VStack() {
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
            
            // Footer Button with NavigationLink
            NavigationLink(destination: ChatView()) {
                Text("Start conversation")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            .padding(.vertical, 10)
            
//            Spacer()
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

struct SectionCard: View {
    let title: String
    let backgroundColor: String
    let audioTime: String
    let description: String
    let isWhite: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center) {
                // Space Between
                Text(title)
                    .font(
                        Font.custom("SF Pro", size: 20)
                            .weight(.semibold)
                    )
                    .foregroundColor(isWhite ? Color(red: 0.92, green: 0.29, blue: 0.35) : Color.white)
                
                Spacer()
                // Alternative Views and Spacers
                Image(systemName: "pencil")
                    .foregroundColor(isWhite ? .black : .white)

            }
            .padding(.leading, 0)
            .padding(.trailing, 9)
            .padding(.vertical, 0)
            .frame(width: 302, alignment: .center)
            HStack(alignment: .center, spacing: 12) {
                HStack(alignment: .center, spacing: 4) {
                    Text("02:15")
                    .font(
                    Font.custom("SF Pro", size: 12)
                    .weight(.medium)
                    )
                    .foregroundColor(isWhite ? Color(red: 0.53, green: 0.49, blue: 0.46) : Color(.white))
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 0)
                .frame(height: 26, alignment: .center)
                .background(isWhite ? Color(red: 0.47, green: 0.47, blue: 0.5).opacity(0.2) : Color(.white.opacity(0.2)))
                .cornerRadius(15)
                
                Image(isWhite ? "WaveChart" : "LightWaveChart")
                    //.renderingMode(.template)
                
                Button(action:{}){
                    HStack(alignment: .center, spacing: 0) {
                        Image(systemName: "play.fill")
                            .foregroundColor(isWhite ? Color(red: 0.53, green: 0.49, blue: 0.46) : Color(.white))
                    }
                    .padding(0)
                    .frame(width: 34, height: 34, alignment: .center)
                    .background(isWhite ? Color(red: 0.47, green: 0.47, blue: 0.5).opacity(0.2) : Color(.white.opacity(0.2)))
                    .cornerRadius(100)
                }

            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(isWhite ? Color(red: 0.47, green: 0.47, blue: 0.5).opacity(0.1) : Color(.white.opacity(0.1)))
            .cornerRadius(20)
            
            
        }
        
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(!isWhite ?
        LinearGradient(
        stops: [
        Gradient.Stop(color: .black.opacity(0), location: 0.00),
        Gradient.Stop(color: .black.opacity(0.16), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0, y: 0),
        endPoint: UnitPoint(x: 1, y: 1)
        ) :
                        LinearGradient(
                        stops: [
                        Gradient.Stop(color: .black.opacity(0), location: 0.00),
                        Gradient.Stop(color: .black.opacity(0), location: 0.00),
                        ],
                        startPoint: UnitPoint(x: 0, y: 0),
                        endPoint: UnitPoint(x: 0, y: 0)
                        )
        )
        .background(Color(backgroundColor))
        .cornerRadius(25)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
