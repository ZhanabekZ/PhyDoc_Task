
//   let timeSlots = try? JSONDecoder().decode(TimeSlots.self, from: jsonData)

import Foundation

// MARK: - TimeSlots
struct TimeSlots: Codable {
    let slots: [Slot]?
}

// MARK: - Slot
struct Slot: Codable {
    let id: Int?
    let datetime: String?
    let price: Int?
}
