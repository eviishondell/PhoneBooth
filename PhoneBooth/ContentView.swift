//
//  ContentView.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/20/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // App Title
                Text("Phonebooth")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
                    .padding(.bottom, 4)
                
                // Subtitle
                Text("Voices that click. Matches that stick.")
                    .font(.subheadline)
                    .foregroundColor(.brown)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                
                // Background rings
                ZStack {
                    ForEach(1..<6) { i in
                        Circle()
                            .stroke(Color.red.opacity(0.2), lineWidth: 1)
                            .scaleEffect(CGFloat(i) * 0.2)
                    }
                    Circle()
                        .fill(Color.red.opacity(0.2))
                        .frame(width: 10, height: 10)
                }
                .frame(width: 300, height: 300)
                .padding(.bottom, 40)
                
                // Buttons
                NavigationLink(destination: IntroduceYourselfView()) {
                    Text("Create Account")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 40)
                
                Button(action: {
                    // Action for Sign In
                }) {
                    Text("Sign In")
                        .font(.subheadline)
                        .foregroundColor(.brown)
                }
                .padding(.top, 10)
                
                Spacer()
            }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
