

import Foundation
import SwiftUI
 
class ViewModel: ObservableObject {
    @Published var dataSource: TimeSlots?
    @Published var slotsByDate = [String: [Slot]]()
    @Published var selectedSlotID: Int? = nil
    let appointmentURL = "https://phydoc-test-2d45590c9688.herokuapp.com/appoint/"
    
    
    
    @MainActor func getData(type: String) {
        APICaller.getTimeSlotsInfo(type: type) { [weak self] result in
            switch result {
            case .success(let data):
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                DispatchQueue.main.async {
                    self?.dataSource = data
                    if let slots = self?.dataSource?.slots {
                        self?.sortSchedule(initialSlots: slots)
                    }
                }
                print("SUCCESS")
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func makeAnAppointment(selectedSlotID: Int) async throws -> FinalMessage {
        guard let encoded = try? JSONEncoder().encode(Appointment(slot_id: selectedSlotID, type: UserDefaults.standard.string(forKey: "orderForm") ?? "")) else {
            print("Failed to encode appointment")
            throw AppointmentError.invalidEncoding
        }
        
        if let url = URL(string: appointmentURL) {
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            
            do {
                let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
                
                let decodedData = try JSONDecoder().decode(FinalMessage.self, from: data)
                print(decodedData)
            } catch {
                print(error)
            }
        }
        throw AppointmentError.invalidURL
    }
    
    private func sortSchedule(initialSlots: [Slot]) {
        slotsByDate = [String : [Slot]]()
        
        for initialSlot in initialSlots {
            var day = ""
            var time = ""
            do {
                (day, time) = try TimeSlotDateFormatter().getDay(date: initialSlot.datetime ?? "")
            } catch {
                print(error)
                return
            }
            let slot = Slot(id: initialSlot.id, datetime: time, price: initialSlot.price)
            if (slotsByDate[day] == nil) {
                slotsByDate[day] = [slot]
            } else {
                slotsByDate[day]?.append(slot)
            }
        }
    }
    
    
    
    
}
