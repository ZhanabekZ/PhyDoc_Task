
import SwiftUI

struct ShowMoreButton: View {
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            action?()
            
        }) {
            Text("Показать еще")
                .font(Font.system(size: 18, weight: Font.Weight.bold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
        }
        .padding(16)
        .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56, alignment: .center)
        .background(.white)
        .cornerRadius(28)
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .inset(by: 1)
                .stroke(Color(red: 0.82, green: 0.84, blue: 0.87), lineWidth: 2)
        )
    }
}

