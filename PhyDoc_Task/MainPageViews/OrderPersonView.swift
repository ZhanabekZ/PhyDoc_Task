
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
    
    let samplePersonData = PersonData(fullName: "Иванов Иван", IIN: "041115486195", phoneNumber: "+7 707 748 4815", address: "ул. Гани Иляева 15")
    
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
                    PersonInfoView(isNextActionAllowed: $isAnyOptionSelected, profileData: samplePersonData)
                } else {
                    PersonInfoFillingView(fullName: $fullName, IIN: $IIN, phoneNumber: $phoneNumber, address: $address, isNextActionAllowed: $isAnyOptionSelected, isNextTapped: $isNextButtonTapped)
                }
            }
            Spacer()
            HStack {
                BackButton(tapped: $isBackButtonTapped)
                GoToNextPageButton(isNextActionAllowed: $isAnyOptionSelected, isTapped: $isNextButtonTapped) {
                    if selectedPersonTag == 0 {
                        UserDefaults.standard.setValue(samplePersonData.fullName, forKey: "orderPersonName")
                    } else {
                        UserDefaults.standard.setValue(fullName, forKey: "orderPersonName")
                    }
                }
            }
            
            .navigationDestination(isPresented: $isNextButtonTapped) {
                OrderTimeView().environmentObject(ViewModel())
            }
            .navigationDestination(isPresented: $isBackButtonTapped) {
                OrderFormatView()
            }
            .navigationDestination(isPresented: $isDismissed) {
                HomePageView()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

struct OrderPersonView_Previews: PreviewProvider {
    static var previews: some View {
OrderPersonView()
        
    }
}
