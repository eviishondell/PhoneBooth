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
    @State private var selectedColor: Color = Color(red : 0.4117647058823529, green:0.3411764705882353, blue: 0.7137254901960784)//.red // Default selected color
    

    
    let promptCards = [1, 2, 3, 4, 5, 6] // Array to generate 6 prompt cards
    
//    let colors = ["#4069AB", "#3CA05B", "#D3723D", "#F27BAB", "#6957B6", "#C45353"] //Array of Colors
    let colors = ["ipod-Blue", "ipod-Green", "ipod-Orange", "ipod-Pink", "ipod-Purple", "ipod-Red"] //Array of Colors
    
    let names = ["Jason", "Laurene", "David", "Ares", "Zeus", "Zagreus"]

    var body: some View {
        NavigationView {
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
                    Text("Explore")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    Spacer() // Placeholder to center the title
                }
                .padding()
                
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
                                    Image("Transcripts")
                                        .padding(.bottom, 30)
                                    
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
                                        
                                        Image("Audio Progress Bar")
                                            .foregroundColor(.white)
                                        
                                        
                                        // Playback Controls
                                        HStack {
                                            Button(action:{})
                                            {
                                                Image(systemName: "gobackward.15")
                                                    .resizable()
                                                    .frame(width : 38, height: 38, alignment: .center)
                                                    .foregroundColor(.white)
                                            }
                                            
                                            Spacer()
                                            
                                            Button(action:{})
                                            {
                                                Image(systemName: "pause.fill")
                                                    .resizable()
                                                    .frame(width: 38, height: 44)
                                                    .foregroundColor(.white)
                                            }
                                            
                                            Spacer()
                                            
                                            Button(action:{})
                                            {
                                                Image(systemName: "goforward.15")
                                                    .resizable()
                                                    .frame(width : 38, height: 38, alignment: .center)
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        .padding()
                                        //.background(selectedColor)
                                        .cornerRadius(12)
                                        .padding(.horizontal, 20)
                                        
                                    }
                                }// Card V Stack
                                .padding(.horizontal, 24)
                                .padding(.vertical, 32)
                                .frame(width: 320, height: 477, alignment: .leading)
                                .background(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: .black.opacity(0), location: 0.00),
                                            Gradient.Stop(color: .black.opacity(0.16), location: 1.00),
                                        ],
                                        startPoint: UnitPoint(x: 0, y: 0),
                                        endPoint: UnitPoint(x: 1, y: 1)
                                    )
                                )
                                
                                //.background(Color(hex: colors[index]))
                                .background(Color(colors[index]))
                                .background(.white)
                                .cornerRadius(32)
                                
                                
                                
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
                        }}
                    
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
                    
                    Button(action: {
                        // Confirm action for the selected color
                    }) {
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
                .padding(.horizontal, 20)
                
                //sSpacer()
                Divider()
                TabView {
                    HStack(alignment: .center, spacing: 16) {
                        Image("ExploreTab")
                            .tabItem {
                                
                            }
                            .tag(0)
                        
                        NavigationLink(
                            destination: ChatListView()
                        ) {
                            
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
        }
    
    }


}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
