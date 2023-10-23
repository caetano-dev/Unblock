import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var title: String = ""
    @State var description: String = ""
    @State var isCompleted: Bool = false
    @State var startDate = Date()
    @State var endDate = Date()
    @State var durationInMinutes: Int = 0
    @State var isHabit: Bool = false
    @State var location: String = ""
    @State var attendees: String = ""
    @State var recurrence: String = ""
    @State var colorCategory: String = ""
    @State var notes: String = ""
    @State var priority: Int = 0
    @State var url: String = ""
    @State var isAllDay: Bool = false
    @State var organizer: String = ""
    @State var status: String = ""
    @State var tags: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State private var showEventEditView: Bool = false
    @State var selectedItem: ItemModel

    
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
                
                Button(action: saveButtonPressed, label: {
                    Text("Save")
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(.buttonBorder)
                })
                    Button("Add to calendar") {
                        self.showEventEditView.toggle()
                        print("click")
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
                .padding(30)
                .sheet(isPresented: $showEventEditView, content: {
                    EventEditViewController(item: selectedItem) // this is a view, but I can't pass the item here. How do I solve this?
                })
                
            }
            .padding(14)
        }
        .navigationTitle("Add an item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
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
            listViewModel.addItem(newItem: newItem)
            
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if title.count < 3 {
            alertTitle = "Your to-do needs to be at least 3 characters long."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}
   
#Preview {
    NavigationView{
        AddView(selectedItem: mockItem)
    }.environmentObject(ListViewModel())
}
