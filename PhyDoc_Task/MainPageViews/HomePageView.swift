//
//  HomePageView.swift
//  PhyDoc_Task
//
//  Created by ZhZinekenov on 13.10.2023.
//

import SwiftUI


struct HomePageView: View {
    @State private var isNextButtonTapped = false
    var body: some View {
        NavigationStack {
                PageIndicator(currentStep: 0, total: 3)
                    .padding()
                Spacer()
                Text("Запишитесь на онлайн/оффлайн прием")
                    .font(.custom("Onest", size: 26))
                    .padding(.bottom, 250)
                Button {
                    isNextButtonTapped = true
                } label: {
                    Text("Перейти к записи")
                        .frame(width: 200, height: 60)
                        .font(.custom("Onest", size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(Color(.white))
                        .background(
                            RoundedRectangle(cornerRadius: 10).fill(Color("neonBlue"))
                        )
                        .padding(.bottom, 100)
                }
            .navigationDestination(isPresented: $isNextButtonTapped) {
                OrderFormatView()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
