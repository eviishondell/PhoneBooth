//
//  ChatsView.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/22/24.
// Updated by Aarnav Sangekar on 11/22/24

import SwiftUI


struct ChatView: View {
    @State private var selectedColor: Color = Color(red : 0.4117647058823529, green:0.3411764705882353, blue: 0.7137254901960784)//.red // Default selected color
    
    @State private var isVoiceChatPlayed: Bool = false // Tracks whether the button has been pressed
    
    @State private var wantsToRecordReply: Bool = false // Tracks whether the Reply button has been pressed once
    
    @State private var isRecordingReply: Bool = false // Tracks whether the Record button has been pressed after pressing reply
    
    @State private var confirmBeforeReply: Bool = false // Tracks whether the Record button has been sent after pressing reply
    
    @State private var sentRecordings = [""]
    
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
                    Spacer()
                    Text("Laurene")
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
                        //VStack(alignment: .leading, spacing: 16){
                        Image("VoiceChats")
                            .padding(.trailing, 48)
                            .frame(width: 294, height: 62)
                        Image("YourChats")
                            .padding(.leading, 48)
                            .frame(width: 294, height: 62)
                        Button(action: {
                            // Change Image to "PlayedVoiceChats"
                            isVoiceChatPlayed.toggle()
                        }) {
                            Image(isVoiceChatPlayed ? "PlayedVoiceChats" : "UnPlayedVoiceChats")
                                .padding(.trailing, 48)
                                .frame(width: 294,
                                       height: isVoiceChatPlayed ? 126 : 62)
                        }
                        
                        // ForEach Loop for Sent Recordings
                        ForEach(sentRecordings, id: \.self) { recording in
                            if(recording != ""){
                                Image("YourChats")
                                    .padding(.leading, 48)
                                    .frame(width: 294, height: 62)
                            }
                        }
                        
                        
                        //}
                        //                        .padding(0)
                        //                        .frame(width: 390, height: 844, alignment: .top)
                        //                        .background(
                        //                        LinearGradient(
                        //                        stops: [
                        //                        Gradient.Stop(color: Color(red: 0.94, green: 0.92, blue: 0.91), location: 0.00),
                        //                        Gradient.Stop(color: Color(red: 0.96, green: 0.89, blue: 0.84), location: 1.00),
                        //                        ],
                        //                        startPoint: UnitPoint(x: 0.5, y: 0),
                        //                        endPoint: UnitPoint(x: 0.5, y: 1)
                        //                        )
                        //                        )
                    }
                    .padding(0)
                    .frame(width: 390, height: 844, alignment: .top)
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
                    
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal, 40)
                .padding(.bottom, 0)
                
                //Spacer()
                
                VStack(alignment: .center, spacing: 12) {
                    
                    // Animated Recording Visual
                    if wantsToRecordReply{ZStack {
                        if(confirmBeforeReply){
                            Image("YourChats")
                            //.padding(.leading , 28)
                                .frame(width: 294, height: 62)
                        }
                        else{
                            if isRecordingReply {
                                Image(systemName: "record.circle.fill")
                                    .scaleEffect(4)
                                    .symbolEffect(.bounce, options: .speed(0.01) .repeating)
                                    .foregroundColor(.red)
                                
                            }
                            
                            if wantsToRecordReply{
                                Image(systemName: "record.circle.fill")
                                    .scaleEffect(4)
                                    .foregroundColor(.red)
                            }
                        }
                        
                        
                    }
                        
                    .frame(width: 50, height: 50)
                        .padding(.bottom, 20)}
                    
                    
                    
                    if(confirmBeforeReply){
                        HStack(alignment: .top, spacing: 10) {
                            //Re-Record
                            Button(action:{confirmBeforeReply.toggle()}) {
                                HStack(alignment: .center, spacing: 8) {
                                    // Re-record Button
                                    Text("Re-record")
                                        .font(
                                            Font.custom("SF Pro", size: 14)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.92, green: 0.29, blue: 0.35))
                                }
                                .padding(12)
                                .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48, alignment: .center)
                                .background(Color(red: 0.98, green: 0.78, blue: 0.8))
                                .cornerRadius(12)
                            }
                            
                            //Send
                            Button(action:{confirmBeforeReply.toggle()
                                wantsToRecordReply.toggle()
                                isRecordingReply.toggle()
                                sentRecordings.append("1")}) {
                                    HStack(alignment: .center, spacing: 8) {
                                        // Send Button
                                        Text("Send")
                                            .font(
                                                Font.custom("SF Pro", size: 14)
                                                    .weight(.semibold)
                                            )
                                            .foregroundColor(.white)
                                    }
                                    .padding(12)
                                    .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48, alignment: .center)
                                    .background(Color(red: 0.92, green: 0.29, blue: 0.35))
                                    .cornerRadius(12)
                                }
                            
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48, alignment: .topLeading)
                    }
                    Button(action: {
                        if(!wantsToRecordReply){
                            wantsToRecordReply.toggle()
                        }
                        else if(!isRecordingReply){
                            isRecordingReply.toggle()
                        }
                        else if(!confirmBeforeReply){
                            confirmBeforeReply.toggle()
                        }
                        else{
                            isRecordingReply.toggle()
                            wantsToRecordReply.toggle()
                            confirmBeforeReply.toggle()
                            sentRecordings.append("1")
                        }
                        
                    }) {
                        if(!confirmBeforeReply){
                            HStack(alignment: .center, spacing: 8) {
                                if wantsToRecordReply {
                                    if isRecordingReply{
                                        
                                        Image(systemName: "stop.fill")
                                            .foregroundColor(Color.white)
                                        Text("Stop")
                                            .font(
                                                Font.custom("SF Pro", size: 14)
                                                    .weight(.semibold)
                                            )
                                        .foregroundColor(Color.white)}
                                    
                                    
                                    else{
                                        Image(systemName: "microphone.fill")
                                            .foregroundColor(Color.white)
                                        Text("Record")
                                            .font(
                                                Font.custom("SF Pro", size: 14)
                                                    .weight(.semibold)
                                            )
                                            .foregroundColor(Color.white)
                                    }
                                    
                                } else {
                                    Image(systemName: "message.badge.waveform.fill")
                                        .foregroundColor(Color.white)
                                    Text("Reply")
                                        .font(
                                            Font.custom("SF Pro", size: 14)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color.white)
                                }
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48, alignment: .center)
                            .background(Color(red: 0.92, green: 0.29, blue: 0.35))
                            .cornerRadius(12)
                        }
                    }
                    
                }
                .padding(24)
                .frame(maxWidth: .infinity, alignment: .topLeading)
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

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
