import Foundation

class ListRowViewModel: ObservableObject {
    private let item: ItemModel

    init(item: ItemModel) {
        self.item = item
    }

    func formattedStartDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: item.startDate)
    }
}
