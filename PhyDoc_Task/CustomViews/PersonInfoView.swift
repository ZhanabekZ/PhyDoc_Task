import SwiftUI

struct PersonInfoView: View {
    @Binding var isNextActionAllowed: Bool
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
    @Binding var isNextActionAllowed: Bool
    @Binding var isNextTapped: Bool
    
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
                .onSubmit {
                    validateInput()
                }
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
                .onSubmit {
                    validateInput()
                }
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
                .onSubmit {
                    validateInput()
                }
        }
        .padding(.bottom, 16)
        
        
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Ошибка в заполнении."), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func validateInput() {
        if fullName.isEmpty || IIN.isEmpty || phoneNumber.isEmpty || address.isEmpty {
            showAlert = true
            alertMessage = "Пожалуйста проверьте все поля."
        } else {
            isNextActionAllowed = true
        }
        
    }
}
