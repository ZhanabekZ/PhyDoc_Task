

import Foundation

enum AppointmentError: Error {
    case invalidEncoding
    case invalidURL
}

enum NetworkError: Error {
    case urlError
    case canNotParseData
    case noData
}

public class APICaller {
    static func getTimeSlotsInfo(type: String, completionHandler: @escaping (_ result: Result<TimeSlots, NetworkError>) -> Void) {
        let urlString = "https://phydoc-test-2d45590c9688.herokuapp.com/get_schedule?type=" + type
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            do {
                guard let data = dataResponse else {
                    completionHandler(.failure(.noData))
                    return
                }
                
                let decoder = JSONDecoder()
                
                let resultData = try decoder.decode(TimeSlots.self, from: data)
                completionHandler(.success(resultData))
            } catch {
                print("Error decoding JSON: \(error)")
                completionHandler(.failure(.canNotParseData))
                return
            }
        }
        .resume()
        
    }
}
