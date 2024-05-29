//
//  EditButton.swift
//  MuscleTracker
//
//  Created by Genereller Account  on 27.05.24.
//

import SwiftUI

struct InfoButton: View {
    
    @State private var showTutorial = false
    var body: some View {
        Button(action: {
            showTutorial.toggle()
        }) {
            Image(systemName: "questionmark.circle")
                .foregroundColor(.accent1)
        }
        .padding()
        .sheet(isPresented: $showTutorial) {
            TutorialView()
        }
    }
}

#Preview {
    InfoButton()
}
