//
//  OrderTimeView.swift
//  PhyDoc_Task
//
//  Created by ZhZinekenov on 09.10.2023.
//

import SwiftUI

struct OrderTimeView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var isBackButtonTapped = false
    @State private var isAnyOptionSelected = true
    @State private var isNextButtonTapped = false
    @State private var isDismissed = false
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 75) {
                Spacer()
                PageIndicator(currentStep: 3, total: 3)
                DismissButtonView(tapped: $isDismissed)
                    .padding(.trailing, 50)
            }
            LargeHeaderView(text: "Выберите дату и время")

        }
    }
}

struct OrderTimeView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTimeView()
    }
}
