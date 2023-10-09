//
//  FinalView.swift
//  PhyDoc_Task
//
//  Created by ZhZinekenov on 13.10.2023.
//

import SwiftUI

struct FinalView: View {
    var body: some View {
        ZStack {
            Color("neonBlue")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                LargeHeaderView(text: "Вы записаны на прием!")
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                    .padding(.bottom, 10)
                
                Text("Мы отправим вам уведомление чтобы вы не забыли о приеме. \nЕсли захотите изменить или отменить запись, вы можете сделать на странице с записями.")
                    .frame(alignment: .leading)
                    .foregroundColor(Color.white)
                    .font(.custom("Onest", size: 16))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(2)
                    .padding(.leading, 20)
                    .frame(maxWidth: 350)
                Spacer()
                Button {
                } label: {
                    Text("Хорошо")
                        .frame(maxWidth: 194)
                        .frame(height: 56)
                        .font(.custom("Onest", size: 16))
                        .fontWeight(.bold)
                        .background(
                            RoundedRectangle(cornerRadius: 28).fill(Color.white)
                        )
                        .foregroundColor(Color("darkBlue"))
                }
            }
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
