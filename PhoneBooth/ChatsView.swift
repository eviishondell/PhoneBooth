//
//  ChatsView.swift
//  PhoneBooth
//
//  Created by Evolone Layne on 11/22/24.
//


import SwiftUI

struct ChatsView: View {
    @Environment(\.presentationMode) var presentationMode // Access presentationMode
    var body: some View {
        HStack {
            Button(action: {
                // Back button action
                presentationMode.wrappedValue.dismiss() // Go back to the previous view
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.red)
                    .font(.system(size: 18))
            }
           
        }.navigationBarBackButtonHidden(true)
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        AllSetView()
    }
}
