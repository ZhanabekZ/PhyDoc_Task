//
//  PersonInfoView.swift
//  PhyDoc_Task
//
//  Created by ZhZinekenov on 11.10.2023.
//

import SwiftUI

struct PersonInfoView: View {
    var profileData: PersonData
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Имя и фамилия:")
                .frame(alignment: .leading)
                .foregroundColor(Color("grayText"))
                .font(.custom("Onest", size: 16))
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
                
            Text(profileData.fullName)
                .frame(alignment: .leading)
                .foregroundColor(Color("darkBlue"))
                .font(.custom("Onest", size: 18))
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 10)
        }
        
        VStack(alignment: .leading, spacing: 8) {
            Text("ИИН:")
                .frame(alignment: .leading)
                .foregroundColor(Color("grayText"))
                .font(.custom("Onest", size: 16))
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
            Text(profileData.IIN)
                .frame(alignment: .leading)
                .foregroundColor(Color("darkBlue"))
                .font(.custom("Onest", size: 18))
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 10)
        }
        
        VStack(alignment: .leading, spacing: 8) {
            Text("Номер телефона:")
                .frame(alignment: .leading)
                .foregroundColor(Color("grayText"))
                .font(.custom("Onest", size: 16))
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
            Text(profileData.phoneNumber)
                .frame(alignment: .leading)
                .foregroundColor(Color("darkBlue"))
                .font(.custom("Onest", size: 18))
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 10)
        }
        
        VStack(alignment: .leading, spacing: 8) {
            Text("Адрес прописки:")
                .frame(alignment: .leading)
                .foregroundColor(Color("grayText"))
                .font(.custom("Onest", size: 16))
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
            Text(profileData.address)
                .frame(alignment: .leading)
                .foregroundColor(Color("darkBlue"))
                .font(.custom("Onest", size: 18))
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 10)
        }
    }
}


struct CustomRoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal)
            .frame(width: 320, height: 56)
        
            .background(RoundedRectangle(cornerRadius: 12).stroke(Color("lightGray"), lineWidth: 2))
    }
}

struct PersonInfoFillingView: View {
    @Binding var fullName: String
    @Binding var IIN: String
    @Binding var phoneNumber: String
    @Binding var address: String
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Имя и фамилия")
                .frame(alignment: .leading)
                .foregroundColor(Color("darkBlue"))
                .font(.custom("Onest", size: 16))
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
            
            TextField("Иванов Иван", text: $fullName)
                .textFieldStyle(CustomRoundedTextFieldStyle())
        }
        .padding(.bottom, 16)
        
        VStack(alignment: .leading, spacing: 8) {
            Text("ИИН")
                .frame(alignment: .leading)
                .foregroundColor(Color("darkBlue"))
                .font(.custom("Onest", size: 16))
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
            
            TextField("Введите ИИН человека", text: $IIN)
                .textFieldStyle(CustomRoundedTextFieldStyle())
        }
        .padding(.bottom, 16)
        
        VStack(alignment: .leading, spacing: 8) {
            Text("Номер телефона")
                .frame(alignment: .leading)
                .foregroundColor(Color("darkBlue"))
                .font(.custom("Onest", size: 16))
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
            
            TextField("Введите номер телефона", text: $phoneNumber)
                .textFieldStyle(CustomRoundedTextFieldStyle())
        }
        .padding(.bottom, 16)
        
        VStack(alignment: .leading, spacing: 8) {
            Text("Адрес")
                .frame(alignment: .leading)
                .foregroundColor(Color("darkBlue"))
                .font(.custom("Onest", size: 16))
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
            
            TextField("Адрес прописки", text: $address)
                .textFieldStyle(CustomRoundedTextFieldStyle())
        }
        .padding(.bottom, 16)
        .onDisappear {
            validateInput()
        }
    }
    
    private func validateInput() {
        validateFullName()
        validateIIN()
        validatePhoneNumber()
        // No validation for address as it can be any string
    }
    
    private func validateFullName() {
        let words = fullName.split(separator: " ")
        if words.count != 2 {
            // Invalid full name format
            // Handle the error, e.g., show an alert or update a validation message
        }
    }
    
    private func validateIIN() {
        if IIN.count != 12 || !IIN.allSatisfy(\.isNumber) {
            // Invalid IIN format
            // Handle the error, e.g., show an alert or update a validation message
        }
    }
    
    private func validatePhoneNumber() {
        let phoneRegex = "^\\+7\\s\\d{3}\\s\\d{3}\\s\\d{2}\\s\\d{2}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if !phonePredicate.evaluate(with: phoneNumber) {
            // Invalid phone number format
            // Handle the error, e.g., show an alert or update a validation message
        }
    }
}
