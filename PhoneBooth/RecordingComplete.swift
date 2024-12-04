//
//  RecordingComplete.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 12/4/24.
//
//  RecordingComplete.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 12/4/24.
//

import SwiftUI

struct RecordingComplete: View {
    @Environment(\.presentationMode) var presentationMode // Access presentationMode for navigation

    var body: some View {
        VStack {
            // Custom Back Button
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Navigate back to the previous view
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
            Text("Recording Complete!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom, 10)

            // Subtitle
            Text("Thank you for self-reflecting today! See what others have to say today")
                .multilineTextAlignment(.center)
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

            // Start Button with NavigationLink
            NavigationLink(destination: ExploreView()) {
                Text("Explore other's stories")
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
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(white: 1.0), Color(white: 0.95)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

struct RecordingComplete_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecordingComplete() // Preview within a navigation stack
        }
    }
}
