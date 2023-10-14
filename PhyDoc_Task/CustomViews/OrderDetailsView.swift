

import SwiftUI
import Foundation

struct OrderDetailsView: View {
    let form = UserDefaults.standard.string(forKey: "orderForm")
    let personName = UserDefaults.standard.string(forKey: "orderPersonName")
    let orderDate = UserDefaults.standard.string(forKey: "orderDate")
    let orderTime = UserDefaults.standard.string(forKey: "orderTime")
    let orderPrice = UserDefaults.standard.string(forKey: "orderPrice")
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                DetailCellView(title: "ВРЕМЯ", subtitle: orderTime ?? "")
                DetailCellView(title: "ДАТА", subtitle: orderDate ?? "")
                DetailCellView(title: "ЦЕНА", subtitle: orderPrice ?? "")
            }
            .padding(20)
            
            Text("Формат приема:")
                .font(.custom("Onest", size: 18))
                .foregroundColor(Color("grayText"))
                .padding(.bottom, 5)
                .padding(.leading, 20)
            Text(form ?? "")
                .font(.custom("Onest", size: 20))
                .foregroundColor(Color("darkBlue"))
                .fontWeight(.semibold)
                .padding(.bottom, 10)
                .padding(.leading, 20)


            
            Text("Пациент:")
                .font(.custom("Onest", size: 18))
                .foregroundColor(Color("grayText"))
                .padding(.bottom, 5)
                .padding(.leading, 20)


            Text(personName ?? "Иванов")
                .font(.custom("Onest", size: 20))
                .foregroundColor(Color("darkBlue"))
                .fontWeight(.semibold)
                .padding(.leading, 20)

        }
    }
}
        
struct DetailCellView: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: -2) {
            Text(title)
                .font(.custom("Onest", size: 13))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("grayText"))
            
            Text(subtitle)
                .font(.custom("Onest", size: 17))
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("darkBlue"))
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
        .frame(width: 120, height: 80)
        .background(
            Color("lightGray")
        )
        .cornerRadius(16)
    }
}

struct PaymentCardView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            Image("visaCardImg")
            VStack {
                Text("••••  4515")
                    .font(.custom("Onest", size: 13))
                    .foregroundColor(Color("darkBlue"))
                    .fontWeight(.bold)
                Text("03/24")
                    .font(.custom("Onest", size: 13))
                    .foregroundColor(Color("grayText"))
            }
            
            Text("4500₸")
                .font(.custom("Onest", size: 20))
                .fontWeight(.semibold)
                .foregroundColor(Color("darkBlue"))
            
            Image(systemName: "chevron.down")
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .frame(width: 100, height: 80)
        .background(
            Color("lightGray")
        )
        .cornerRadius(16)
    }
}
