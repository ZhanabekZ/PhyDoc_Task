

import SwiftUI

struct OrderPaymentView: View {
    @State private var appointmentResult: Result<FinalMessage, Error>?
    @EnvironmentObject private var viewModel: ViewModel
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
                
            VStack {
                WarningView()
                DoctorInfoView()
                OrderDetailsView()
                
                Spacer()
                HStack {
                    BackButton(tapped: $isBackButtonTapped)
                    FinalButton() {
                        Task {
                            do {
                                let result = try await viewModel.makeAnAppointment(selectedSlotID: viewModel.selectedSlotID ?? 0)
                                appointmentResult = .success(result)
                            } catch {
                                appointmentResult = .failure(error)
                            }
                        }
                        isNextButtonTapped.toggle()
                    }
                }
            }
            .navigationDestination(isPresented: $isNextButtonTapped) {
                FinalView()
            }
            .navigationDestination(isPresented: $isBackButtonTapped) {
                OrderTimeView()
            }
            .navigationDestination(isPresented: $isDismissed) {
                HomePageView()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

struct OrderPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderPaymentView()
    }
}
