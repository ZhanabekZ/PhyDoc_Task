
import SwiftUI

struct DismissButtonView: View {
    @Binding var tapped: Bool
    var body: some View {
        Button {
            tapped.toggle()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(Color("grayPickerBorder"))
        }

    }
}
