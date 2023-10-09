//
//  NetworkViewModel.swift
//  PhyDoc_Task
//
//  Created by ZhZinekenov on 13.10.2023.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var dataSource: TimeSlots?
    
    func getData(type: String) {
        APICaller.getTimeSlotsInfo(type: type) { [weak self] result in
            switch result {
            case .success(let data):
                self?.dataSource = data
                print("SUCCESS")
            case .failure(let error):
                print(error)
            }
        }
    }
}
