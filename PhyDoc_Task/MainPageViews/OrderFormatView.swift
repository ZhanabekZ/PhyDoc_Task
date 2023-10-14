
import SwiftUI

struct OrderFormatView: View {
    @State private var isAnyOptionSelected = false
    @State private var isNextButtonTapped = false
    @State private var isBackButtonTapped = false
    @State private var isDismissed = false
    
    @State private var isOnlineOptionSelected = false
    @State private var isClinicOptionSelected = false
    @State private var isHomeOptionSelected = false
    @State private var orderForm = ""
    
    var body: some View {
        NavigationStack {
                HStack(spacing: 75) {
                    Spacer()
                    PageIndicator(currentStep: 1, total: 3)
                    DismissButtonView(tapped: $isDismissed)
                        .padding(.trailing, 50)
                }
                VStack(alignment: .leading) {
                    LargeHeaderView(text: "Выберите формат \nприема")
                        .padding(.bottom, 30)
                    CustomOptionButton(title: "Онлайн-консультация", subtitle: "Врач созвонится с вами и проведет консультацию в приложении.", isSelected: $isOnlineOptionSelected)
                        .simultaneousGesture(TapGesture().onEnded {
                            isAnyOptionSelected = true
                            if !isOnlineOptionSelected {
                                orderForm = "online"
                                isOnlineOptionSelected = true
                                isClinicOptionSelected = false
                                isHomeOptionSelected = false
                                UserDefaults.standard.setValue(orderForm, forKey: "orderForm")

                            }
                        })
                    
                    CustomOptionButton(title: "Записаться в клинику", subtitle: "Врач будет ждать вас в своем кабинете в клинике.", isSelected: $isClinicOptionSelected)
                        .simultaneousGesture(TapGesture().onEnded {
                            isAnyOptionSelected = true
                            if !isClinicOptionSelected {
                                orderForm = "offline"
                                isOnlineOptionSelected = false
                                isClinicOptionSelected = true
                                isHomeOptionSelected = false
                                UserDefaults.standard.setValue(orderForm, forKey: "orderForm")

                            }
                        })
                    
                    CustomOptionButton(title: "Вызвать на дом", subtitle: "Врач сам приедет к вам домой в указанное время и дату.", isSelected: $isHomeOptionSelected)
                        .simultaneousGesture(TapGesture().onEnded {
                            isAnyOptionSelected = true
                            if !isHomeOptionSelected {
                                orderForm = "offline"
                                isOnlineOptionSelected = false
                                isClinicOptionSelected = false
                                isHomeOptionSelected = true
                                UserDefaults.standard.setValue(orderForm, forKey: "orderForm")

                            }
                        })
                }
                Spacer()
                HStack {
                    BackButton(tapped: $isBackButtonTapped)
                    GoToNextPageButton(isNextActionAllowed: $isAnyOptionSelected, isTapped: $isNextButtonTapped) {
                        print(orderForm)
                    }
                }
            .navigationDestination(isPresented: $isNextButtonTapped) {
                OrderPersonView()
            }
            .navigationDestination(isPresented: $isBackButtonTapped) {
                HomePageView()
            }
            .navigationBarBackButtonHidden()
        }
    }
}
    
    
    
struct PageIndicator: View {
    let currentStep: Int
    let total: Int
    var body: some View {
        HStack(spacing: 8) {
            ForEach(1...total, id: \.self) { step in
                Rectangle()
                    .frame(width: 28, height: 6)
                    .foregroundColor(step <= currentStep ? Color("neonBlue") : Color("lightGrayPage"))
                    .cornerRadius(4)
                
            }
        }
    }
}
    
struct CustomOptionButton: View {
    let title: String
    let subtitle: String
    @Binding var isSelected: Bool
    var body: some View {
        Button {
        } label: {
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(Color("darkBlue"))
                    .font(.custom("Onest", size: 20))
                    .fontWeight(.semibold)
                    .padding(.leading, 20)
                    .padding(.bottom, 1)
                Text(subtitle)
                    .frame(alignment: .leading)
                    .foregroundColor(Color("grayText"))
                    .font(.custom("Onest", size: 16))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(2)
                    .padding(.leading, 20)
            }
            .frame(maxWidth: 320, alignment: .leading)
            .frame(height: 116)
            .background(Color("lightGray")
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(isSelected ? Color("neonBlue") : Color.clear, lineWidth: 2)
                        .background(isSelected ? Color("neonBlue").opacity(0.07) : Color.clear)
                )
            )
        }
        .cornerRadius(12)
        .padding(.bottom, 10)
    }
}

struct OrderFormatView_Previews: PreviewProvider {
    static var previews: some View {
        OrderFormatView()
    }
}
