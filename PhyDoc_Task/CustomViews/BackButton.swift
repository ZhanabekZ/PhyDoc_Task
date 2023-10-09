//
//  BackButton.swift
//  PhyDoc_Task
//
//  Created by ZhZinekenov on 11.10.2023.
//

import SwiftUI

struct BackButton: View {
    @Binding var tapped: Bool
    var body: some View {
        Button {
            tapped.toggle()
        } label: {
            HStack {
                Image("backIcon")
                    .resizable()
                    .renderingMode(.original)
                    .frame(maxWidth: 12, maxHeight: 12)
                Text("Назад")
                    .font(.custom("Onest", size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(Color("darkBlue"))
            }
            .frame(maxWidth: 114)
            .frame(height: 56)
            .background(content: {
                RoundedRectangle(cornerRadius: 28)
                    .strokeBorder(Color("grayPickerBorder"), lineWidth: 2)
            })
        }
    }
}
