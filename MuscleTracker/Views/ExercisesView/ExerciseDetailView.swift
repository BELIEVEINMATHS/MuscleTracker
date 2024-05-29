import SwiftUI

struct ExerciseDetailView: View {
    @Binding var exercise: Exercise

    var body: some View {
        ZStack{
            Color.color3.opacity(0.2)
            VStack {
                TextField("Exercise Name", text: $exercise.name)
                    .font(.largeTitle)
                    .padding()

                TextField("Description", text: $exercise.description)
                    .padding()

                // Intensity Slider
                VStack {
                    Text("Intensity: \(exercise.intensity)")
                    Slider(value: $exercise.intensity.doubleValue, in: 0...10, step: 1)
                        .padding()
                }

                // Type Picker
                Picker("Type", selection: $exercise.type) {
                    ForEach(ExerciseType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                HStack{
                    // Weight
                    HStack {
                        Text("Weight (kg)")
                            .font(.title3)
                        TextField("Weight", value: $exercise.weight, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                    .padding()
                    
                    
                    
                    // Group Picker
                    Picker("Group", selection: $exercise.group) {
                        ForEach(ExerciseGroup.allCases, id: \.self) { group in
                            Text(group.rawValue).tag(group.rawValue)
                        }
                    }
                    .padding()
                    
                }
                
                
                
                
                // Conditional View for Reps or Time
                if exercise.type == .reps {
                    HStack {
                        Text("Reps")
                            .font(.title3)
                        TextField("Reps", value: $exercise.reps, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                    }
                    .padding()
                } else {
                    HStack {
                        Text("Time (min)")
                            .font(.title3)
                        TextField("Time", value: $exercise.time, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                    .padding()
                }
                
                HStack{
                    VStack{
                        Text("Primary Muscles")
                            .font(.title3)
                        ScrollView {
                            VStack {
                                ForEach(MuscleGroup.allCases, id: \.self) { muscle in
                                    MultipleSelectionRow(title: muscle.rawValue, isSelected: exercise.primaryMuscles.contains(muscle.rawValue)) {
                                        if exercise.primaryMuscles.contains(muscle.rawValue) {
                                            exercise.primaryMuscles.removeAll(where: { $0 == muscle.rawValue })
                                        } else {
                                            exercise.primaryMuscles.append(muscle.rawValue)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(height: 150)
                    }
                    
                    
                    VStack{
                        Text("Secondary Muscles")
                            .font(.title3)
                        ScrollView {
                            VStack {
                                ForEach(MuscleGroup.allCases, id: \.self) { muscle in
                                    MultipleSelectionRow(title: muscle.rawValue, isSelected: exercise.secondaryMuscles.contains(muscle.rawValue)) {
                                        if exercise.secondaryMuscles.contains(muscle.rawValue) {
                                            exercise.secondaryMuscles.removeAll(where: { $0 == muscle.rawValue })
                                        } else {
                                            exercise.secondaryMuscles.append(muscle.rawValue)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(height: 150)
                    }
                }
                

                Spacer()

                Button(action: {
                    // Dismiss the view by setting the binding to nil
                    // However, in this case, the view will be dismissed from the sheet environment.
                }) {
                    Text("Save")
                        .padding()
                        .foregroundColor(.accent1)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        
    }
}

// Utility extension for converting Int to Double for the slider
extension Binding where Value == Int {
    var doubleValue: Binding<Double> {
        Binding<Double>(
            get: { Double(self.wrappedValue) },
            set: { self.wrappedValue = Int($0) }
        )
    }
}

// Enum for Exercise Group
enum ExerciseGroup: String, CaseIterable, Codable {
    case calisthenics = "Calisthenics"
    case machine = "Machine"
    case weights = "Weights"
    // Add more groups as needed
}

// Enum for Muscle Groups
enum MuscleGroup: String, CaseIterable, Codable {
    case chest = "Chest"
    case back = "Back"
    case legs = "Legs"
    case arms = "Arms"
    // Add more muscles as needed
}

// View for multiple selection row
struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
            .padding()
            .foregroundColor(.accent1)
            .cornerRadius(8)
            .shadow(radius: 3)
        }
    }
}
