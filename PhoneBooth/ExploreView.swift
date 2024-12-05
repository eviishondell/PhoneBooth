//
//  ExploreView.swift
//  PhoneBooth
//
//  Created by Aarnav Sangekar on 11/20/24.
//

import SwiftUI

// SwiftUI
let trasncriptImage = Image("Transcripts")

struct ExploreView: View {
    @Environment(\.presentationMode) var presentationMode // Access presentationMode for navigation
    @State private var selectedColor: Color = Color(red : 0.4117647058823529, green:0.3411764705882353, blue: 0.7137254901960784)//.red // Default selected color
    
    let loadedNewSound = false;
    @State private var isPlayingSound : Bool = false
    
    let promptCards = [1, 2, 3, 4, 5, 6] // Array to generate 6 prompt cards
    
//    let colors = ["#4069AB", "#3CA05B", "#D3723D", "#F27BAB", "#6957B6", "#C45353"] //Array of Colors
    let colors = ["ipod-Blue", "ipod-Green", "ipod-Orange", "ipod-Pink", "ipod-Purple", "ipod-Red"] //Array of Colors
    
    let names = ["Nyx", "Persephone", "Zagreus", "Hercules", "Athena", "Zeus"]
    
    //Please fold the below array
    let transcriptsText = ["The earliest childhood memory I have is ...",
                           "My favourite childhood dish is ...",
                           "Ride or Die, thats my motto ...",
                           "What's a moment you were proud of? ...",
                           "My first grade teacher was extremely memorable...",
                           "My first job ever was ..."
    ]
    
    let audioFiles = ["Childhood Memory", "Favourite Childhood Food", "Life_s Motto", "Something you are proud of", "Teacher or mentor", "Work"]

    @State private var activeCardIndex: Int? = 1 // Track the active card index
    @State private var selectedTab: Int = 0
    var body: some View {
        NavigationView {
            VStack {
                // Navigation Bar
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
                    Text("Explore")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                    Spacer() // Placeholder to center the title
                        .frame(width: 50)
                }
                .padding()
                .navigationBarBackButtonHidden(true)
                
                Spacer()
                
                ScrollView(.horizontal
                           ,showsIndicators: false
                ) {
                    HStack(spacing: 16) {
                        ForEach(promptCards.indices, id: \.self) { index in
                            // Prompt Card
                            VStack {
                                //Inner Contents
                                VStack{
                                    //Transcripts
                                    VStack(alignment: .trailing) {
                                        Text(transcriptsText[index])
                                        .font(
                                        Font.custom("SF Pro", size: 24)
                                        .weight(.semibold)
                                        )
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white.opacity(0.6))
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 8)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                                    .background(.white.opacity(0.12))
                                    .cornerRadius(20)

                                    
                                    //Information Playback Controls
                                    VStack {
                                        //Information
                                        HStack(alignment: .center){
                                            VStack(alignment: .leading) {
                                                Text("\(names[index])")
                                                    .font(.title2)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                                
                                                HStack(alignment: .firstTextBaseline){
                                                    
                                                    Text("\(Image(systemName: "airplane")) 2 hrs")
                                                        .font(.body)
                                                        .foregroundColor(.white.opacity(0.9))
                                                }
                                                
                                            }
                                            .frame(width:186, alignment: .topLeading)
                                            
                                            ZStack{
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
                                        
                                        AudioPlayer(expandSheet: .constant(true), audioString: audioFiles[index], type: ".m4a")
                                            .padding(.horizontal, 8)
                                            .onAppear {
                                                print(audioFiles[index])
                                            }
                                    
                                    }
                                    
                                }// Card V Stack
                                .padding(.horizontal, 24)
                                .padding(.vertical, 32)
                                .frame(width: 320, height: 477, alignment: .leading)
                                .background(Color(colors[index]))
                                .background(.white)
                                .cornerRadius(32)
                                
//                                .swipeActions(edge: .trailing) {
//                                       Button(role: .destructive, action: {
//                                           withAnimation {
//                                               // Remove the card from the list
//                                               promptCards.removeAll { $0 == index }
//                                           }
//                                       }) {
//                                           Label("Delete", systemImage: "trash.fill")
//                                       }
//                                   }
                                
                            }
                            //.containerRelativeFrame(.horizontal, count:1)
                            .scrollTransition{content, phase in
                                content
                                    .scaleEffect(x :1,
                                                 y : phase.isIdentity
                                                 ?
                                                 1
                                                 :
                                                    0.9
                                    )
                                
                            }
                        }
                    }
                    
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal, 40)
                .padding(.bottom, 40)
                
                
                Spacer()
                
                // View Profile and Reply Buttons
                HStack {
                    Button(action: {
                        // View Profile  action
                    }) {
                        NavigationLink(destination: ProfileView()) {
                            HStack {
                                Text("View Profile")
                                    .fontWeight(.bold)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.pink.opacity(0.2))
                            .foregroundColor(.red)
                            .cornerRadius(10)
                        }

                    }
                    
                    Button(action: {
                        // Confirm action for the selected color
                    }) {
                        NavigationLink(destination: ChatView()) {
                            HStack {
                                
                                Text("Reply")
                                    .fontWeight(.bold)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
                
                .padding(.horizontal, 20)
                
                //sSpacer()
//                Spacer()
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
                    NavigationLink(destination: ProfilePage()) {
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
                    .simultaneousGesture(TapGesture().onEnded {
                        selectedTab = 2
                    })
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

        } .navigationBarHidden(true)
    
    }


}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
