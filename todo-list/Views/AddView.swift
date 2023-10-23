import Foundation
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var isCompleted: Bool = false
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var durationInMinutes: Int = 0
    @State private var isHabit: Bool = false
    @State private var location: String = ""
    @State private var attendees: String = ""
    @State private var recurrence: String = ""
    @State private var colorCategory: String = ""
    @State private var notes: String = ""
    @State private var priority: Int = 0
    @State private var url: String = ""
    @State private var isAllDay: Bool = false
    @State private var organizer: String = ""
    @State private var status: String = ""
    @State private var tags: String = ""
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    @State private var showEventEditView: Bool = false
    @State private var selectedItem: ItemModel?
    private let minTitleLength = 3
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Title", text: $title)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(.buttonBorder)
                
                TextField("Description", text: $description)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(.buttonBorder)
                
                
                DatePicker("Starting on", selection: $startDate, displayedComponents: .date)
                
                DatePicker("At", selection: $startDate, displayedComponents: .hourAndMinute)
                
                DatePicker("Ending on", selection: $endDate, displayedComponents: .date)
                
                DatePicker("At", selection: $endDate, displayedComponents: .hourAndMinute)
                
                Toggle("Habit", isOn: $isHabit)
                
                TextField("Location", text: $location)
                
                TextField("Attendees", text: $attendees)
                
                TextField("Recurrence", text: $recurrence)
                
                TextField("Color Category", text: $colorCategory)
                
                TextField("Notes", text: $notes)
                
                TextField("URL", text: $url)
                
                Toggle("All Day Event", isOn: $isAllDay)
                
                TextField("Organizer", text: $organizer)
                
                TextField("Status", text: $status)
                
                TextField("Tags", text: $tags)
                
                
                Button(action: saveButtonPressed) {
                    Text("Save")
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(.buttonBorder)
                }
                
                Button("Add to calendar") {
                    showEventEditView.toggle()
                    createNewItem()
                }
                .sheet(isPresented: $showEventEditView) {
                    if let selectedItem = selectedItem {
                        EventEditViewController(item: selectedItem)
                    }
                }
            }
            .padding(14)
            .navigationTitle("Add an item")
            .alert(isPresented: $showAlert, content: getAlert)
        }
    }
    
    private func createNewItem() {
        let startDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: startDate)
        let endDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: endDate)
        
        let newItem = ItemModel(
            title: title,
            description: description,
            isCompleted: isCompleted,
            startDate: startDateComponents,
            endDate: endDateComponents,
            createdAt: Date(),
            isHabit: isHabit,
            location: location,
            attendees: attendees.components(separatedBy: ", "),
            recurrence: recurrence,
            colorCategory: colorCategory,
            notes: notes,
            priority: priority,
            url: URL(string: url),
            isAllDay: isAllDay,
            organizer: organizer,
            status: status,
            tags: tags.components(separatedBy: ", ")
        )
        
        selectedItem = newItem
    }
    
    private func saveButtonPressed() {
        if textIsAppropriate() {
            createNewItem()
            listViewModel.addItem(newItem: selectedItem!)
            dismiss()
        }
    }
    
    private func textIsAppropriate() -> Bool {
        if title.count < minTitleLength {
            alertTitle = "Your to-do needs to be at least \(minTitleLength) characters long."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    private func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }.environmentObject(ListViewModel())
}
