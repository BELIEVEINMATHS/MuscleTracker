import SwiftUI

struct TutorialView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Welcome to MuscleTracker!")
                .font(.largeTitle)
                .padding()

            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("MuscleTracker helps you keep track of your muscle workouts and recovery times. Follow this tutorial to get started and make the most out of the app.")
                        .padding(.bottom)

                    Group {
                        Text("1. Viewing Your Body Views")
                            .font(.headline)
                        Text("When you open the app, you'll see a list of body views (e.g., Front, Back). Tap on any body view to see the muscles associated with that view.")
                    }
                    
                    Group {
                        Text("2. Interacting with Muscle Buttons")
                            .font(.headline)
                        Text("On the body view screen, you'll see several buttons positioned over different muscle areas. Each button represents a specific muscle. Tap on a muscle button to view its recovery details.")
                    }
                    
                    Group {
                        Text("3. Editing Muscle Details")
                            .font(.headline)
                        Text("To edit muscle details, tap the **Edit** button at the bottom of the screen. While in edit mode, tap on any muscle button to open the editor.")
                    }
                    
                    Group {
                        Text("4. Muscle Recovery Editor")
                            .font(.headline)
                        Text("In the Muscle Recovery Editor, you can update the recovery time for the muscle. Adjust the details and tap **Save** to update the muscle information.")
                    }
                    
                    Group {
                        Text("5. Tracking Recovery")
                            .font(.headline)
                        Text("The main screen shows the recovery time left for each muscle in days. The recovery time is automatically calculated based on the last trained date and the recovery time you set.")
                    }
                    
                    
                    Group {
                        Text("6. Tips for Best Use")
                            .font(.headline)
                        Text("Regularly update your muscle training details to keep accurate track of your recovery times. Use the app before each workout to ensure your muscles have recovered adequately. Customize your recovery times to fit your specific workout routine.")
                    }
                    
                    Group {
                        Text("Common Questions")
                            .font(.headline)
                        Text("**Q: How do I know if a muscle has fully recovered?**")
                            .bold()
                        Text("A muscle is considered fully recovered when its recovery time left is 0 hours.")
                        
                        Text("**Q: How do I reset a muscle's recovery time?**")
                            .bold()
                        Text("Simply tap the muscle button while in edit mode, update the recovery time, and click on Done.")
                    }
                }
                .padding(.horizontal)
            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Got it!")
                    .padding()
                    .background(Color.accent1)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
        .padding()
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
