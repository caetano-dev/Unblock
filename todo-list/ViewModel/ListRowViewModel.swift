import Foundation

class ListRowViewModel: ObservableObject {
    @Published var item: ItemModel

    init(item: ItemModel) {
        self.item = item
    }

    func formattedStartDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE h:mm a" // Adjust the date format as needed
        return dateFormatter.string(from: item.startDate)
    }
}

