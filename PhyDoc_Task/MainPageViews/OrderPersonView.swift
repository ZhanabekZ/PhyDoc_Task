//
//  OrderPersonView.swift
//  PhyDoc_Task
//
//  Created by ZhZinekenov on 09.10.2023.
//

import SwiftUI

struct OrderPersonView: View {
    @State private var fullName = ""
    @State private var IIN = ""
    @State private var phoneNumber = ""
    @State private var address = ""
    @State private var isBackButtonTapped = false
    @State private var isAnyOptionSelected = true
    @State private var isNextButtonTapped = false
    @State private var isDismissed = false

    @State private var selectedPersonTag = 0
    
    private let samplePersonData = PersonData(fullName: "Иванов Иван", IIN: "041115486195", phoneNumber: "+7 707 748 4815", address: "ул. Гани Иляева 15")
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 75) {
                Spacer()
                PageIndicator(currentStep: 2, total: 3)
                DismissButtonView(tapped: $isDismissed)
                    .padding(.trailing, 50)
            }
            
            VStack(alignment: .leading) {
                LargeHeaderView(text: "Выберите кого хотите записать")
                    .padding(.bottom, 30)
                CustomPickerView(isNextActionAllowed: $isAnyOptionSelected, selectedTag: $selectedPersonTag)
                    .padding(.bottom, 14)
                if selectedPersonTag == 0 {
                    PersonInfoView(profileData: samplePersonData)
                } else {
                    PersonInfoFillingView(fullName: $fullName, IIN: $IIN, phoneNumber: $phoneNumber, address: $address)
                }
            }
            Spacer()
            HStack {
                BackButton(tapped: $isBackButtonTapped)
                GoToNextPageButton(isNextActionAllowed: $isAnyOptionSelected, isTapped: $isNextButtonTapped)
            }
            
            .navigationDestination(isPresented: $isNextButtonTapped) {
                OrderTimeView()
            }
            .navigationDestination(isPresented: $isBackButtonTapped) {
                OrderFormatView()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

