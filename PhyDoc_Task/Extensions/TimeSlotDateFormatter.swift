

import Foundation

struct TimeSlotDateFormatter {
    let dateFormatter = DateFormatter()
    
    func getDay(date: String) throws -> (dayString: String, timeString: String) {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        if let date = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "dd MMMM"
            let dayString = dateFormatter.string(from: date)
            
            dateFormatter.dateFormat = "HH:mm"
            let timeString = dateFormatter.string(from: date)
            
            return (dayString, timeString)
        }
        else {
            return ("", "")
        }
    }
}
