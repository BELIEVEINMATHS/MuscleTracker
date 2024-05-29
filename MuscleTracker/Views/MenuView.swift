//
//  MenuView.swift
//  MuscleTracker
//
//  Created by Genereller Account  on 27.05.24.
//

import SwiftUI




struct MenuView: View {
    @State private var showTutorial = false
    @State private var showStats = false
    @State private var showSettings = false
    @State private var showProfile = false
    
    var body: some View {
        ZStack {
            Color.color3
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Spacer()
                MenuOptionButton(title: "Profile", systemImageName: "person.crop.circle")
                    .onTapGesture {
                        showProfile.toggle()
                    }
                MenuOptionButton(title: "Settings", systemImageName: "gearshape")
                    .onTapGesture {
                        showSettings.toggle()
                    }
                MenuOptionButton(title: "Stats", systemImageName: "chart.bar")
                    .onTapGesture {
                        showStats.toggle()
                    }
                MenuOptionButton(title: "Info", systemImageName: "info.circle")
                    .onTapGesture {
                        showTutorial.toggle()
                    }
                
                Spacer()
                Spacer()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .popover(isPresented: $showTutorial) {
                TutorialView()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.9)
            }
            .popover(isPresented: $showStats) {
                StatsView()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.9)
            }
            .popover(isPresented: $showSettings) {
                SettingsView()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.9)
            }
            .popover(isPresented: $showProfile) {
                ProfileView()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.9)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.7) // Adjust the width as needed
    }
}

#Preview {
    MenuView()
}




