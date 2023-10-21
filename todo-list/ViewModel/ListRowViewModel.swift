import Foundation

class ListRowViewModel: ObservableObject {
    private let item: ItemModel

    init(item: ItemModel) {
        self.item = item
    }

    func formattedStartDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.string(from: item.startDate)
    }
    func formattedStartTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: item.startTime)
    }
    func formattedEndDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.string(from: item.endDate)
    }
    func formattedEndTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: item.endTime)
    }
    func calculateEventDurationAsString() -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: item.startTime, to: item.endTime)
        
        if let hours = components.hour, let minutes = components.minute {
            if hours > 0 {
                if minutes > 0 {
                    return String(format: "%d:%d", hours, minutes)
                } else if hours == 1 && minutes == 0{
                    return String(format: "%d hour", hours, minutes)
                } else {
                    return String(format: "%d hours", hours)
                }
            } else {
                return String(format: "%d minutes", minutes)
            }
        } else {
            return "0 minutes"
        }
    }

}
