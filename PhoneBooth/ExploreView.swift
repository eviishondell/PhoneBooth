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

    var body: some View {
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
                    ForEach(promptCards, id: \.self) { _ in
                        // Prompt Card
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 32)
                                    .fill(selectedColor)
                                    .frame(width: 320,height: 477)
                                //.padding(.horizontal, 20)
                                
                                //Inner Contents
                                VStack{
                                    Image("Transcripts")
                                        .padding(.bottom, 30)
                                    
                                    //Information Playback Controls
                                    VStack {
                                        //Information
                                        HStack(alignment: .center){
                                            VStack(alignment: .leading) {
                                                Text("Laurene")
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
                                                Image("GoBack15")
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
                                                Image("GoBack15")
                                                    .resizable()
                                                    .frame(width : 38, height: 38, alignment: .center)
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        .padding()
                                        .background(selectedColor)
                                        .cornerRadius(12)
                                        .padding(.horizontal, 20)
                                        
                                    }
                                }
                                
                            }
                            
                            
                            .background(selectedColor)
                            .cornerRadius(32)
                            //.padding(.horizontal, 20)
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

                HStack {
                    NavigationLink(destination: ProfileView()) {
                        Text("View Profile")
                            .fontWeight(.bold)
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
                    NavigationLink(destination: ChatsView()){
                        Image("ExploreTab")
                            .tabItem {
                                
                            }
                            .tag(0)
                    }
                    NavigationLink(destination: ChatsView()){
                        Image("Chats")
                            .tabItem {
                                
                            }
                            .tag(1)
                    }
                    
                    NavigationLink(destination: ChatsView()){
                        Image("Profile")
                            .tabItem {
                                
                            }
                            .tag(2)
                    }
                }
                .padding(.top, 23)
            
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

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
