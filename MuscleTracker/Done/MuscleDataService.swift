import Foundation

struct MusclesDataService {
    var view: String
    
    func getData() -> MuscleArray {
        if view == "front" {
            return MuscleArray(muscleArray: [
                Muscle(name: "Chest", recoveryTime: 2, positionX: 43, positionY: 24),
                Muscle(name: "Biceps", recoveryTime: 2, positionX: 29, positionY: 30),
                Muscle(name: "Forearm", recoveryTime: 2, positionX: 21, positionY: 37),
                Muscle(name: "Shoulder", recoveryTime: 2, positionX: 34, positionY: 24),
                Muscle(name: "Front of thigh", recoveryTime: 2, positionX: 40, positionY: 55),
                Muscle(name: "Stomach", recoveryTime: 2, positionX: 50, positionY: 35),
                Muscle(name: "Side", recoveryTime: 2, positionX: 40, positionY: 33),
                Muscle(name: "Calf", recoveryTime: 2, positionX: 39, positionY: 71)
            ])
        } else if view == "back" {
            return MuscleArray(muscleArray: [
                Muscle(name: "Trapezius", recoveryTime: 2, positionX: 50, positionY: 25),
                Muscle(name: "Lats", recoveryTime: 2, positionX: 40, positionY: 30),
                Muscle(name: "Triceps", recoveryTime: 2, positionX: 26, positionY: 29),
                Muscle(name: "Lower back", recoveryTime: 2, positionX: 50, positionY: 36),
                Muscle(name: "Glutes", recoveryTime: 2, positionX: 45, positionY: 44),
                Muscle(name: "Hamstrings", recoveryTime: 2, positionX: 58, positionY: 55),
                Muscle(name: "Calves", recoveryTime: 2, positionX: 63, positionY: 70)
            ])
        } else {
            return MuscleArray(muscleArray: [])
        }
    }
}
