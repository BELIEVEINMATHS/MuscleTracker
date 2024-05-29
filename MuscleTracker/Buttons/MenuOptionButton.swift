//
//  MenuOptionButton.swift
//  MuscleTracker
//
//  Created by Genereller Account  on 27.05.24.
//

import SwiftUI

struct MenuOptionButton: View {
    var title: String
    var systemImageName: String
    
    var body: some View {
        HStack {
            Image(systemName: systemImageName)
                .font(.system(size: 24))
                .foregroundColor(.color2)
            Text(title)
                .font(.system(size: 24))
                .foregroundColor(.color2)
                .padding(.leading, 10)
            Spacer()
        }
        .padding()
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(.horizontal, 20)
    }
}


#Preview {
    MenuOptionButton(title: "Profile", systemImageName: "person.crop.circle")
}
