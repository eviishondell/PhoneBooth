//
//  ViewProfile.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/22/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Profile Header
                HStack {
                    Image("ProfilePicture") // Replace with your profile image name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("Laurene")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Female, 50 y.o.")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()

                // Introduction Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Introduction")
                        .font(.headline)
                        .foregroundColor(.red)
                    
                    Text("Hi there! I’m Laurene. When I’m not reading or writing, you’ll find me exploring new cuisines and traveling to discover hidden gems.")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                // Other Sections (Travel, Food, Hobbies)
                ForEach(["Travel", "Food", "Hobbies"], id: \.self) { section in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(section)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("Lorem ipsum content for \(section.lowercased()). Add more details or adjust the layout as needed.")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(sectionBackgroundColor(section))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
            }
            .padding(.bottom, 50)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Helper function to provide different background colors
    func sectionBackgroundColor(_ section: String) -> Color {
        switch section {
        case "Travel":
            return Color.green
        case "Food":
            return Color.orange
        case "Hobbies":
            return Color.purple
        default:
            return Color.gray
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
