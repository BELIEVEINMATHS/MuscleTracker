//
//  BodyViewDataService.swift
//  MuscleTracker
//
//  Created by Genereller Account  on 26.05.24.
//

import Foundation

struct BodyViewDataService {
    func getData() -> [BodyView]{
        let bodyViewArray: [BodyView] = [BodyView(name: "Front",logoName: "hammer",imageName: "Front", muscles: MusclesDataService(view: "front").getData()),
                                         BodyView(name: "Back",logoName: "hammer", imageName: "Back", muscles: MusclesDataService(view: "back").getData())]
        return bodyViewArray
    }
}
