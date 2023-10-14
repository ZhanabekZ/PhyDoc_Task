

import SwiftUI

struct DoctorInfoView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 72, height: 72)
                .padding(20)
            
            VStack {
                Text("Оксана Михайловна")
                    .font(.custom("Onest", size: 15))
                    .fontWeight(.semibold)
                Text("Офтальмолог")
                    .font(.custom("Onest", size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(Color("grayText"))
                    .padding(.bottom, -10)

                HStack {
                Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.gray)
                    
                Text("4,9 • Шымкент")
                    .font(.custom("Onest", size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(Color("grayText"))
                
                }
            }
            .padding(20)
            Image(systemName: "ellipsis.message")
                    .frame(width: 55, height: 45)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.clear)
                    )
                    .background(content: {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color("grayPickerBorder"), lineWidth: 2)
                    })
                    .padding(20)
        }
    }
}

struct DoctorInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorInfoView()
    }
}
