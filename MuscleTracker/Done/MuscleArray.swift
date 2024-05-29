import Foundation

struct MuscleArray: RandomAccessCollection, Codable, Hashable, Equatable {
    var muscleArray: [Muscle]
    
    var startIndex: Int { muscleArray.startIndex }
    var endIndex: Int { muscleArray.endIndex }
    
    subscript(position: Int) -> Muscle {
        get { muscleArray[position] }
        set { muscleArray[position] = newValue }
    }
    
    func getMuscles() -> [Muscle] {
        return muscleArray
    }

    static func == (lhs: MuscleArray, rhs: MuscleArray) -> Bool {
        return lhs.muscleArray == rhs.muscleArray
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(muscleArray)
    }
}
