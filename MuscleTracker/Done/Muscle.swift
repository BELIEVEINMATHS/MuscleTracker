import Foundation

struct Muscle: Identifiable, Equatable, Hashable, Codable {
    var id: UUID = UUID()
    var name: String
    var dateLastTrained: Date = Date()
    var recoveryTime: Int
    var positionX: Int
    var positionY: Int

    func getTimeUntilRecovery() -> Double {
        let timeInterval = Date().timeIntervalSince(dateLastTrained)
        return timeInterval / 3600 // Convert seconds to hours
    }
}
