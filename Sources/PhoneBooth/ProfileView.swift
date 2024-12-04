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
                Spacer()
                VStack(spacing: 4) {
                    Text("Laurene")
                        .padding()
                        .font(.title2)
                        .modifier(ConditionalBoldModifier()) // Use `bold()` as a fallback for `fontWeight(.bold)`
                        .foregroundColor(.black)
                    Text("Female, 50 y.o.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .modifier(ConditionalNavigationBarBackButtonHidden()) // Conditional modifier for back button

            ScrollView {
                VStack(spacing: 20) {
                    // Introduction Section
                    SectionCard(
                        title: "Introduction",
                        backgroundColor: Color.white,
                        audioTime: "02:15",
                        description: "Hi there! I’m Laurene. When I’m not reading or writing, you’ll find me exploring new cuisines and traveling to discover hidden gems."
                    )

                    // Travel Section
                    SectionCard(
                        title: "Travel",
                        backgroundColor: Color.green.opacity(0.2),
                        audioTime: "01:09",
                        description: "I love exploring new places and learning about different cultures."
                    )

                    // Food Section
                    SectionCard(
                        title: "Food",
                        backgroundColor: Color.orange.opacity(0.2),
                        audioTime: "03:12",
                        description: "Cooking and trying out new cuisines is my passion."
                    )

                    // Hobbies Section
                    SectionCard(
                        title: "Hobbies",
                        backgroundColor: Color.purple.opacity(0.2),
                        audioTime: "03:12",
                        description: "Reading, writing, and gardening are my favorite hobbies."
                    )
                }
                .padding(.horizontal)
            }

            // Footer Button with NavigationLink
            NavigationLink(destination: ChatView()) {
                Text("Start conversation")
                    .font(.headline)
                    .modifier(ConditionalBoldModifier())// Use `bold()` as a fallback for `fontWeight(.bold)`
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            .padding(.vertical, 10)

            // Tab Bar with Highlighted "Profile" Tab
            Divider()
            HStack(alignment: .center, spacing: 16) {
                // Explore Tab
                NavigationLink(destination: ExploreView()) {
                    Image("ExploreTab")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 0 ? .red : .gray)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    selectedTab = 0
                })

                // Chats Tab
                NavigationLink(destination: ChatListView()) {
                    Image("Chats")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 1 ? .red : .gray)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    selectedTab = 1
                })

                // Profile Tab
                Button(action: {
                    selectedTab = 2 // Ensure "Profile" stays selected
                }) {
                    Image("Profile")
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 2 ? .red : .gray)
                }
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
        .background(Color.gray.opacity(0.1).ignoresSafeArea()) // Removed UIColor usage
        .modifier(ConditionalNavigationBarHidden()) // Conditional navigation bar hidden
        .onAppear {
            selectedTab = 2 // Highlight the "Profile" tab when this view appears
        }
    }
}

struct ConditionalBoldModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(macOS 13.0, *) {
            content.bold()
        } else {
            content
        }
    }
}


// Section Card Component
struct SectionCard: View {
    let title: String
    let backgroundColor: Color
    let audioTime: String
    let description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(.red)

            HStack {
                Text(audioTime)
                    .font(.subheadline)
                    .modifier(ConditionalBoldModifier()) // Use `bold()` as a fallback for `fontWeight(.bold)`
                    .foregroundColor(.gray)

                Spacer()

                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
            }

            Text(description)
                .font(.body)
                .foregroundColor(.gray)
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(12)
    }
}

// Conditional Modifier for Navigation Bar Hidden
struct ConditionalNavigationBarHidden: ViewModifier {
    func body(content: Content) -> some View {
        if #available(macOS 12.0, iOS 16.0, *) {
            content.toolbar {
                ToolbarItem(placement: .automatic) { // Use `.automatic` for compatibility
                    EmptyView() // Ensure no toolbar is displayed
                }
            }
        } else {
            content
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
