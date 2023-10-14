

import SwiftUI

struct CustomPickerView: View {
    @Binding var isNextActionAllowed: Bool
    @Binding var selectedTag: Int
    var body: some View {
        HStack {
            Button {
                selectedTag = 0
                isNextActionAllowed = true
            } label: {
                Text("Себя")
                    .frame(width: 148, height: 46)
                    .font(.custom("Onest", size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(selectedTag == 0 ? Color(.white) : Color("darkBlue"))
                    .background(
                        RoundedRectangle(cornerRadius: 10).fill(selectedTag == 0 ? Color("neonBlue") : Color(.white))
                    )
            }

            
            Button {
                isNextActionAllowed = false
                selectedTag = 1
            } label: {
                Text("Другого")
                    .frame(width: 148, height: 46)
                    .font(.custom("Onest", size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(selectedTag == 1 ? Color(.white) : Color("darkBlue"))
                    .background(
                        RoundedRectangle(cornerRadius: 10).fill(selectedTag == 1 ? Color("neonBlue") : Color(.white))
                    )
            }
        }
        .frame(width: 320, height: 58)
        
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color("grayPickerBorder"), lineWidth: 1)
        )
        .background(Color(.white))
        
    }
}
