import SwiftUI

struct RowView: View {
    let item: Joke

    init(item: Joke) {
        self.item = item
    }

    var body: some View {
        VStack {
            Text(item.value)
            Text(item.createdAt, style: .date)
        }
    }
}
