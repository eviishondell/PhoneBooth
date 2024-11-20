//
//  AllSetView.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/20/24.
//

import SwiftUI

struct AllSetView: View {
    @Environment(\.presentationMode) var presentationMode // Access presentationMode

    var body: some View {
        VStack {
            // Back Button (optional)
            HStack {
                Button(action: {
                    // Back button action if needed
                    presentationMode.wrappedValue.dismiss() // Go back to the previous view

                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.red)
                        .font(.system(size: 18))
                }
                Spacer()
            }
            .padding()

            Spacer()

            // Main Title
            Text("You’re all set!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom, 10)

            // Subtitle
            Text("Ready to meet someone new?\nLet’s get started!")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)

            // Animated Circle
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

            // Start Button
            Button(action: {
                // Start button action (navigate to the next step)
            }) {
                Text("Start")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)

            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(white: 1.0), Color(white: 0.95)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
//        .ignoresSafeArea()
    }
}

struct AllSetView_Previews: PreviewProvider {
    static var previews: some View {
        AllSetView()
    }
}
