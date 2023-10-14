
//   let timeSlots = try? JSONDecoder().decode(TimeSlots.self, from: jsonData)

import Foundation

// MARK: - TimeSlots
struct TimeSlots: Codable, Hashable {
    let slots: [Slot]
}

// MARK: - Slot
struct Slot: Codable, Hashable, Identifiable {
    let id: Int
    let datetime: String?
    let price: Int
}
