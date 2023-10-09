//
//  LargeHeaderView.swift
//  PhyDoc_Task
//
//  Created by ZhZinekenov on 10.10.2023.
//

import SwiftUI

struct LargeHeaderView: View {
    var text: String
    var body: some View {
        Text(text)
            .frame(maxWidth: 320, alignment: .leading)
            .frame(height: 85)
            .font(.custom("Onest", size: 32))
            .fontWeight(.semibold)
    }
}
