//
//  ChatsView.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/22/24.
// Updated by Aarnav Sangekar on 11/22/24

import SwiftUI


struct ChatListView: View {
    @State private var selectedColor: Color = Color(red : 0.4117647058823529, green:0.3411764705882353, blue: 0.7137254901960784)//.red // Default selected color

    var body: some View {
        NavigationView {
            VStack {
                // Navigation Bar
                HStack {
                    Spacer()
                    Spacer()
                    Text("Chats")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    Spacer() // Placeholder to center the title
                }
                .padding()
                
                Spacer()
                
                ScrollView(.vertical
                           ,showsIndicators: false
                ) {
                    VStack(spacing: 16) {
                        NavigationLink(destination:ChatView()){Image("Chat List-1")}
                        Button(action:{}){Image("Chat List")}
                        Button(action:{}){Image("Chat List-2")}
                    }
                    
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal, 40)
                .padding(.bottom, 40)
                
                Spacer()
                
                //Spacer()
                Divider()
                TabView {
                    HStack(alignment: .center, spacing: 16) {
                        Image("ExploreTab")
                            .tabItem {
                                
                            }
                            .tag(0)
                        
                        Button(action :{}){
                            Image("Chats")
                                .tabItem {
                                    
                                }
                                .tag(1)
                        }
                        
                        
                        Image("Profile")
                            .tabItem {
                                
                            }
                            .tag(2)
                    }
                    .padding(.top, 12)
                    
                }
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
        }

    
    }


}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
