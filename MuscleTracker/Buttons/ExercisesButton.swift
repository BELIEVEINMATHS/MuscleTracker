//
//  EditButton.swift
//  MuscleTracker
//
//  Created by Genereller Account  on 27.05.24.
//

import SwiftUI

struct ExercisesButton: View {
    var body: some View {
        
        Text("Exercise")
        .padding()
        .background(Color.accent1)
        .foregroundColor(.white)
        .cornerRadius(8)
        .shadow(radius: 3)
    }
}

#Preview {
    ExercisesButton()
}
