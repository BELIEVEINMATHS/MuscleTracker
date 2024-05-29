import SwiftUI

@propertyWrapper
struct AppStorageCodable<T: Codable> {
    private let key: String
    private let defaultValue: T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            if let data = UserDefaults.standard.data(forKey: key),
               let value = try? JSONDecoder().decode(T.self, from: data) {
                return value
            }
            return defaultValue
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: key)
            }
        }
    }
}

struct HomeView: View {
    var name: String
    
    @State private var muscles: [Muscle] = []
    @State private var isEditing: Bool = false
    @State private var showMenu = false
    @State private var isFrontView: Bool = true  // New state variable to track the current view
    var bodyViewArray: [BodyView] = BodyViewDataService().getData()
    @State private var selectedView: BodyView?
    @State var view: BodyView
    @State private var musclesData: Data?
    @State private var showWorkoutFullScreen = false
    @State private var showExercisesFullScreen = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    HStack {
                        //Menu Button
                        Button {
                            self.showMenu.toggle()
                        } label: {
                            if showMenu == false {
                                Image(systemName: "line.3.horizontal")
                            }
                        }
                        .padding()
                        .foregroundColor(.accent1)
                        .cornerRadius(8)
                        .shadow(radius: 3)
                        
                        Spacer()
                    }
                    
                    Image(view.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.8)
                    HStack{
                        Spacer()
                        // Switch view button
                        Button(action: {
                            switchView()
                        }) {
                            Image(systemName: "arrow.counterclockwise")
                                .padding()
                                .background(Color.accent1)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.top, 10)
                    }
                    
                    Button(action: {
                        showExercisesFullScreen = true
                    }) {
                        ExercisesButton()
                    }
                    .fullScreenCover(isPresented: $showExercisesFullScreen) {
                        ExercisesView()
                    }
                    
//                  NavigationLink(destination: WorkoutView()) {
//                      WorkoutButton()
//                  }

                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .blur(radius: showMenu ? 3 : 0)
                .animation(.easeInOut(duration: 0.6), value: showMenu)
                
                ForEach(muscles.indices, id: \.self) { index in
                    let muscle = muscles[index]
                    let buttonX = geometry.size.width * CGFloat(muscle.positionX) / 100
                    let buttonY = geometry.size.height * CGFloat(muscle.positionY) / 100
                    
                    MuscleButton(muscle: $muscles[index], isEditing: isEditing)
                        .position(x: buttonX, y: buttonY)
                        
                }
                .blur(radius: showMenu ? 3 : 0)
                .animation(.easeInOut(duration: 0.6), value: showMenu)
                
                GeometryReader { _ in
                    MenuView()
                        .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width)
                        .animation(.easeInOut(duration: 0.6), value: showMenu)
                }
                
                
                
                // Add an overlay with a tap gesture to dismiss the menu
                if showMenu {
                    Color.black.opacity(0.001) // Transparent color
                        .frame(width: UIScreen.main.bounds.width * 0.3)
                        .position(x: UIScreen.main.bounds.width * 0.85) // Positioning it to the right 30%
                        .ignoresSafeArea()
                        .onTapGesture {
                            self.showMenu = false
                        }
                }
            }
            .background(Color.color3.opacity(showMenu ? 0.4 : 0))
            .animation(.easeInOut(duration: 0.6), value: showMenu)
            .onAppear {
                selectedView = bodyViewArray.first
                print("View onAppear called. Loading muscles.")
                loadMuscles()
                if muscles.isEmpty {
                    muscles = view.muscles.getMuscles() // Convert MuscleArray to [Muscle]
                }
            }
        }
    }
    
    private func switchView() {
        isFrontView.toggle()
        view = isFrontView ? bodyViewArray.first(where: { $0.name == "Front" })! : bodyViewArray.first(where: { $0.name == "Back" })!
        muscles = view.muscles.getMuscles()
    }
    
    private func saveMuscles() {
        if let encoded = try? JSONEncoder().encode(muscles) {
            UserDefaults.standard.set(encoded, forKey: "musclesData_\(name)")
        }
    }
    
    private func loadMuscles() {
        if let data = UserDefaults.standard.data(forKey: "musclesData_\(name)"),
           let decoded = try? JSONDecoder().decode([Muscle].self, from: data) {
            muscles = decoded
        }
    }
}

struct SpecificBodyView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(name: "Back", view: BodyView(name: "Back", logoName: "hammer", imageName: "back", muscles: MuscleArray(muscleArray: MusclesDataService(view: "back").getData().getMuscles())))
    }
}

