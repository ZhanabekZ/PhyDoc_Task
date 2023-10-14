//
//  PhyDoc_TaskApp.swift
//  PhyDoc_Task
//
//  Created by ZhZinekenov on 09.10.2023.
//

import SwiftUI

@main
struct PhyDoc_TaskApp: App {
    @StateObject private var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            HomePageView()
                .environmentObject(viewModel)
        }
    }
}

