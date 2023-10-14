
import SwiftUI

struct OrderTimeView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @State private var selectedSlotID: Int? = nil
    @State private var displayedKeysNum: Int = 2
    
    let columns: [GridItem] = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]
    @State private var isBackButtonTapped = false
    @State private var isAnyOptionSelected = false
    @State private var isNextButtonTapped = false
    @State private var isDismissed = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 75) {
                    Spacer()
                    PageIndicator(currentStep: 3, total: 3)
                    DismissButtonView(tapped: $isDismissed)
                        .padding(.trailing, 50)
                }
                
                LargeHeaderView(text: "Выберите дату и время")
                ScrollView {
                    
                    WarningView()
                    ScheduleDaysView()
                }
                Spacer()
                HStack {
                    BackButton(tapped: $isBackButtonTapped)
                    GoToNextPageButton(isNextActionAllowed: $isAnyOptionSelected, isTapped: $isNextButtonTapped) {
                        UserDefaults.standard.setValue(selectedSlotID, forKey: "timeSlotID")
                    }
                }
            }
            .navigationDestination(isPresented: $isNextButtonTapped) {
                OrderPaymentView()
            }
            .navigationDestination(isPresented: $isBackButtonTapped) {
                OrderPersonView()
            }
            .navigationDestination(isPresented: $isDismissed) {
                HomePageView()
            }
            .navigationBarBackButtonHidden()
        }
        .onAppear(perform: {
            viewModel.getData(type: UserDefaults.standard.string(forKey: "orderForm") ?? "offline")
        })
    }
    
    
    @ViewBuilder func ScheduleDaysView() -> some View {
        if viewModel.dataSource != nil {
            let sortedKeys = Array(viewModel.slotsByDate.keys).sorted()
            
            VStack(spacing: 10) {
                ForEach(sortedKeys.prefix(displayedKeysNum), id: \.self) { key in
                    if let valuesArray = viewModel.slotsByDate[key] {
                        VStack(alignment: .leading, spacing: 16) {
                            
                            Text(key)
                                .font(.custom("Onest", size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("grayText"))
                            
                            LazyVGrid(columns: columns) {
                                ForEach(valuesArray) { slot in
                                    CellView(time: slot.datetime ?? "", price: slot.price, isSelected: slot.id == selectedSlotID)
                                        .onTapGesture {
                                            isAnyOptionSelected = true
                                            selectedSlotID = slot.id
                                            viewModel.selectedSlotID = selectedSlotID
                                            UserDefaults.standard.setValue(slot.price, forKey: "orderPrice")
                                            UserDefaults.standard.setValue(slot.datetime, forKey: "orderTime")
                                            UserDefaults.standard.setValue(key, forKey: "orderDate")
                                        }
                                }
                            }
                        }
                        .padding(.all, 10)
                    }
                }
                if displayedKeysNum < sortedKeys.count {
                    ShowMoreButton() {
                        displayedKeysNum = sortedKeys.count
                    }
                    .padding(.top, -5)
                }
            }
        } else {
            ProgressView("Loading...")
                .frame(width: 200, height: 200)
                .onAppear(perform: {
                    viewModel.getData(type: UserDefaults.standard.string(forKey: "orderForm") ?? "offline")
                })
        }
    }
}

struct CellView: View {
    let time: String
    let price: Int
    var isSelected: Bool
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ""
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .center, spacing: -2) {
            Text(time)
                .font(.custom("Onest", size: 20))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundColor(
                    isSelected ? Color.white
                    : Color("darkBlue")
                )
            
            Text("\(numberFormatter.string(from: NSNumber(value: price))!)₸")
                .font(Font.system(size: 16))
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .foregroundColor(
                    isSelected ? Color.white : Color("grayText")
                )
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .frame(width: 86, height: 70)
        .background(
            isSelected ? Color("neonBlue") :
                Color("lightGray")
        )
        .cornerRadius(16)
    }
}

struct OrderTimeView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTimeView().environmentObject(ViewModel())
    }
}

struct WarningView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "exclamationmark.triangle")
                .frame(width: 24, height: 24)
            VStack(alignment: .leading, spacing: 8) {
                Text("Отмена и изменение времени приема может стоит денег.")
                    .font(Font.custom("Onest", size: 18))
                    .foregroundColor(Color(red: 0.5, green: 0.19, blue: 0.02))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                
                Text("Подробнее")
                    .font(Font.system(size: 18, weight: Font.Weight.medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.5, green: 0.19, blue: 0.02))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(.white)
                    .cornerRadius(16)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .padding(16)
        .frame(height: 140)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(Color(red: 0.99, green: 0.94, blue: 0.86))
        .cornerRadius(12)
    }
}
