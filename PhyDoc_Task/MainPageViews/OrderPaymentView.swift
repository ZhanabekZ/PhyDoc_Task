//
//  OrderPaymentView.swift
//  PhyDoc_Task
//
//  Created by ZhZinekenov on 13.10.2023.
//

import SwiftUI

struct OrderPaymentView: View {
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
            LargeHeaderView(text: "Подтвердите запись")
        }
    }
}

struct OrderPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderPaymentView()
    }
}
