//
//  GoToNextPageButton.swift
//  PhyDoc_Task
//
//  Created by ZhZinekenov on 09.10.2023.
//
import SwiftUI
import Foundation

struct GoToNextPageButton: View {
    @Binding var isNextActionAllowed: Bool
    @Binding var isTapped: Bool
    var body: some View {
        Button {
            if isNextActionAllowed {
                isTapped.toggle()
            }
        } label: {
            Text("Дальше")
                .frame(maxWidth: 194)
                .frame(height: 56)
                .font(.custom("Onest", size: 16))
                .fontWeight(.bold)
                .background(
                    RoundedRectangle(cornerRadius: 28).fill(isNextActionAllowed ? Color("neonBlue") : Color("lightGray"))
                )
                .foregroundColor(isNextActionAllowed ? Color(.white) : Color("grayNextButtonText"))
        }
    }
}
