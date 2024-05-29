import SwiftUI

struct MuscleButton: View {
    @Binding var muscle: Muscle
    @State private var daysLeft: Double
    @State private var showEditor: Bool = false
    var isEditing: Bool
    
    init(muscle: Binding<Muscle>, isEditing: Bool) {
        _muscle = muscle
        self.isEditing = isEditing

        let daysSinceLastTrained = Calendar.current.dateComponents([.hour], from: muscle.wrappedValue.dateLastTrained, to: Date()).hour ?? 0
        _daysLeft = State(initialValue: max(0, Double(muscle.wrappedValue.recoveryTime) - Double(daysSinceLastTrained) / 24))
    }

    var body: some View {
        VStack {
            Button(action: {
                showEditor.toggle()
            }) {
                VStack {
                    Text("\(String(format: "%.1f", daysLeft))")
                        .font(.subheadline)
                }
                .padding()
                .cornerRadius(8)
                .shadow(radius: 3)
            }
            .foregroundColor(.accent1)
        }
        .sheet(isPresented: $showEditor, onDismiss: {
            updateDaysLeft()
        }) {
            MuscleRecoveryEditor(muscle: $muscle)
        }
        .onAppear {
            updateDaysLeft()
        }
    }

    private func updateDaysLeft() {
        let daysSinceLastTrained = Calendar.current.dateComponents([.hour], from: muscle.dateLastTrained, to: Date()).hour ?? 0
        daysLeft = max(0, Double(muscle.recoveryTime) - Double(daysSinceLastTrained) / 24)
    }
}

struct MuscleButton_Previews: PreviewProvider {
    static var previews: some View {
        MuscleButton(muscle: .constant(Muscle(name: "Pectoralis", recoveryTime: 2, positionX: 50, positionY: 50)), isEditing: true)
    }
}
