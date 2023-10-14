

import SwiftUI

struct FinalButton: View {
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text("Подтвердить и оплатить")
                .frame(maxWidth: 250)
                .frame(height: 56)
                .font(.custom("Onest", size: 16))
                .fontWeight(.bold)
                .background(
                    RoundedRectangle(cornerRadius: 28).fill(Color("neonBlue"))
                )
                .foregroundColor(Color(.white))
        }
    }
        
}

