import SwiftUI

import Foundation

extension UserDefaults {
    func setObject<Object>(_ object: Object, forKey: String) where Object: Encodable {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            self.set(encoded, forKey: forKey)
        }
    }
    
    func getObject<Object>(forKey: String, castTo type: Object.Type) -> Object? where Object: Decodable {
        if let data = self.data(forKey: forKey) {
            let decoder = JSONDecoder()
            return try? decoder.decode(type, from: data)
        }
        return nil
    }
}


@main
struct MuscleTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(name: "Front", view: BodyView(name: "Front", logoName: "hammer", imageName: "Front", muscles: MuscleArray(muscleArray: MusclesDataService(view: "front").getData().getMuscles())))
        }
    }
}
