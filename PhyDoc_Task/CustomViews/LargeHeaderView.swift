

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
