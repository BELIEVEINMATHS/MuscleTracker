import SwiftUI

struct ExercisesView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var exercises: [Exercise] = []
    @State private var selectedExerciseIndex: IdentifiableIndex?
    
    private let exercisesKey = "exercisesKey"
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(exercises.indices, id: \.self) { index in
                        ExercisesRow(name: exercises[index].name, onEdit: {
                            selectedExerciseIndex = IdentifiableIndex(id: index)
                        })
                    }
                    .onDelete(perform: deleteExercise)
                }
                .navigationTitle("Exercises")
                
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Back")
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Spacer()
                    
                    Button(action: addExercise) {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .padding()
                    }
                }
                .padding()
            }
            .sheet(item: $selectedExerciseIndex) { identifiableIndex in
                ExerciseDetailView(exercise: $exercises[identifiableIndex.id])
            }
            .onAppear(perform: loadExercises)
            .onChange(of: exercises) { _ in
                saveExercises()
            }
        }
    }
    
    private func deleteExercise(at offsets: IndexSet) {
        exercises.remove(atOffsets: offsets)
        saveExercises()
    }
    
    private func addExercise() {
        exercises.append(Exercise(name: "New Exercise", description: "Description of the new exercise", intensity: 5, type: .reps, group: "Calisthenics", primaryMuscles: ["Muscle A"], secondaryMuscles: ["Muscle B"], weight: 0.0, reps: 10, time: 0.0))
        saveExercises()
    }
    
    private func saveExercises() {
        UserDefaults.standard.setObject(exercises, forKey: exercisesKey)
    }
    
    private func loadExercises() {
        if let savedExercises: [Exercise] = UserDefaults.standard.getObject(forKey: exercisesKey, castTo: [Exercise].self) {
            exercises = savedExercises
        }
    }
}
