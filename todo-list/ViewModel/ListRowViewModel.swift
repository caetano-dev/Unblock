import Foundation
import SwiftUI
import EventKitUI

class ListRowViewModel: ObservableObject {
    private let item: ItemModel
    
    init(item: ItemModel) {
        self.item = item
    }
}



struct EventEditViewController: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    typealias UIViewControllerType = EKEventEditViewController
    
    
    let item: ItemModel
    
    private let store = EKEventStore()
    private var event: EKEvent {
        let event = EKEvent(eventStore: store)
        event.title = item.title
        
        // Use item.startDate and item.endDate directly without optional binding
        let startDateComponents = DateComponents(year: item.startDate.year, month: item.startDate.month, day: item.startDate.day, hour: item.startDate.hour, minute: item.startDate.minute)
        event.startDate = Calendar.current.date(from: startDateComponents)!
        
        let endDateComponents = DateComponents(year: item.endDate.year, month: item.endDate.month, day: item.endDate.day, hour: item.endDate.hour, minute: item.endDate.minute)
        event.endDate = Calendar.current.date(from: endDateComponents)!
        
        event.location = item.location
        event.notes = item.notes
        
        return event
    }
    
    func makeUIViewController(context: Context) -> EKEventEditViewController {
        let eventEditViewController = EKEventEditViewController()
        eventEditViewController.event = event
        eventEditViewController.eventStore = store
        eventEditViewController.editViewDelegate = context.coordinator
        return eventEditViewController
    }
    
    func updateUIViewController(_ uiViewController: EKEventEditViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, EKEventEditViewDelegate {
        var parent: EventEditViewController
        
        init(_ controller: EventEditViewController) {
            self.parent = controller
        }
        
        func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
