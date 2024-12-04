//
//  AllSetView.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/20/24.
//

import SwiftUICore
import SwiftUI
struct AllSetView: View {
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

            // Start Button with NavigationLink
            NavigationLink(destination: ExploreView()) {
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
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(white: 1.0), Color(white: 0.95)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .modifier(HideBackButtonModifier()) // Use the custom modifier
    }
}

struct HideBackButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(macOS 13.0, iOS 16.0, *) {
            content.navigationBarBackButtonHidden(true)
        } else {
            content
        }
    }
}

struct AllSetView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AllSetView() // Preview within a navigation stack
        }
    }
}
