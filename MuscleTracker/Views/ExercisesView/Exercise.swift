import Foundation

struct Exercise: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var intensity: Int
    var type: ExerciseType
    var group: String
    var primaryMuscles: [String]
    var secondaryMuscles: [String]
    var weight: Double
    var reps: Int
    var time: Double

    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.id == rhs.id &&
               lhs.name == rhs.name &&
               lhs.description == rhs.description &&
               lhs.intensity == rhs.intensity &&
               lhs.type == rhs.type &&
               lhs.group == rhs.group &&
               lhs.primaryMuscles == rhs.primaryMuscles &&
               lhs.secondaryMuscles == rhs.secondaryMuscles &&
               lhs.weight == rhs.weight &&
               lhs.reps == rhs.reps &&
               lhs.time == rhs.time
    }
}

enum ExerciseType: String, Codable, Equatable, CaseIterable {
    case time = "Time"
    case reps = "Reps"
}
