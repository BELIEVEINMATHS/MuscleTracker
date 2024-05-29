//
//  DotDotDotButton.swift
//  MuscleTracker
//
//  Created by Genereller Account  on 28.05.24.
//
import SwiftUI

struct DotDotDotButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "ellipsis.rectangle")
                .font(.title)
                .foregroundColor(.primary)
        }
    }
}


//#Preview {
//    DotDotDotButton()
//}
