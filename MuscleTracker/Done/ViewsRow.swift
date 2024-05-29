import SwiftUI

struct ViewsRow: View {
    var bodyView: BodyView
    
    var body: some View {
        NavigationLink(value: bodyView) {
            HStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                    .padding()
                
                Text(bodyView.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
        }
    }
}
