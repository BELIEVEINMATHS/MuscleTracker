import SwiftUI

struct ExercisesRow: View {
    var name: String
    var onEdit: () -> Void
    
    var body: some View {
        ZStack {
            Color.color2.opacity(0.7)
                .cornerRadius(20)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1)
            
            HStack {
                Text(name)
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                    .padding(.leading, 20)
                Spacer()
                DotDotDotButton(action: onEdit)
                    .padding(.trailing, 20)
            }
            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1)
        }
    }
}


struct ExercisesRow_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesRow(name: "Push Ups", onEdit: {})
    }
}
