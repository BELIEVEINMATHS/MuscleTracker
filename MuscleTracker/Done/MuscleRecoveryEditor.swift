import SwiftUI

struct MuscleRecoveryEditor: View {
    @Binding var muscle: Muscle
    
    var body: some View {
        VStack {
            Text("Edit Recovery Time for \(muscle.name)")
                .font(.headline)
                .padding()
            
            Stepper(value: $muscle.recoveryTime, in: 1...30) {
                Text("Recovery Time: \(muscle.recoveryTime) days")
            }
            .padding()
            
            Button(action: {
                resetRecoveryTime()
            }) {
                Text("Reset Recovery Time")
                    .foregroundColor(.white)
                    
            }
            .padding()
            .background(Color.accentColor)
            .cornerRadius(8)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(radius: 3)
    }
    
    private func resetRecoveryTime() {
        muscle.dateLastTrained = Date()
    }
}

struct MuscleRecoveryEditor_Previews: PreviewProvider {
    @State static var sampleMuscle = Muscle(name: "Pectoralis", recoveryTime: 2, positionX: 50, positionY: 50)
    
    static var previews: some View {
        MuscleRecoveryEditor(muscle: $sampleMuscle)
    }
}
