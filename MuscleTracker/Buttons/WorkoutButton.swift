//
//  EditButton.swift
//  MuscleTracker
//
//  Created by Genereller Account  on 27.05.24.
//

import SwiftUI

struct WorkoutButton: View {
    var body: some View {
        Button(action: {
            
        }){
            Text("Workout")
        }
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
