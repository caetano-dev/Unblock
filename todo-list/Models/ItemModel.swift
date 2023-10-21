import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let isCompleted: Bool
    let startDate: Date
    let startTime: Date
    let endDate: Date
    let endTime: Date
    let durationInMinutes: Int
    let createdAt: Date
    let isHabit: Bool
    let location: String?
    let attendees: [String]?
    let recurrence: String?
    let colorCategory: String?
    let notes: String?
    let priority: Int?
    let url: URL?
    let isAllDay: Bool
    let organizer: String?
    let status: String?
    let tags: [String]?
    
    
    init(id: String = UUID().uuidString, title: String, description: String, isCompleted: Bool, startDate: Date, startTime: Date, endDate: Date, endTime: Date, createdAt: Date, isHabit: Bool, location: String? = nil, attendees: [String]? = nil, recurrence: String? = nil, colorCategory: String? = nil, notes: String? = nil, priority: Int? = nil, url: URL? = nil, isAllDay: Bool, organizer: String? = nil, status: String? = nil, tags: [String]? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
        self.startDate = startDate
        self.startTime = startTime
        self.endDate = endDate
        self.endTime = endTime
        self.durationInMinutes = 0
        self.createdAt = createdAt
        self.isHabit = isHabit
        self.location = location
        self.attendees = attendees
        self.recurrence = recurrence
        self.colorCategory = colorCategory
        self.notes = notes
        self.priority = priority
        self.url = url
        self.isAllDay = isAllDay
        self.organizer = organizer
        self.status = status
        self.tags = tags
    }
    
   

    
    func updateCompletion() -> ItemModel {
        return ItemModel(
            id: id,
            title: title,
            description: description,
            isCompleted: !isCompleted,
            startDate: startDate,
            startTime: startTime,
            endDate: endDate,
            endTime: endTime,
            createdAt: createdAt,
            isHabit: isHabit,
            location: location,
            attendees: attendees,
            recurrence: recurrence,
            colorCategory: colorCategory,
            notes: notes,
            priority: priority,
            url: url,
            isAllDay: isAllDay,
            organizer: organizer,
            status: status,
            tags: tags
        )
    }
    
    

}

let mockItem: ItemModel = ItemModel(
    title: "Sample Task",
    description: "This is a mock task",
    isCompleted: false,
    startDate: Date(),
    startTime: Date(),
    endDate: Date().addingTimeInterval(3600), // One hour later
    endTime: Date().addingTimeInterval(3600),
    createdAt: Date(),
    isHabit: false,
    location: "Mock Location",
    attendees: ["John", "Jane"],
    recurrence: "Weekly",
    colorCategory: "Work",
    notes: "Sample notes for the task",
    priority: 2,
    url: URL(string: "https://example.com/task"),
    isAllDay: false,
    organizer: "John Doe",
    status: "Confirmed",
    tags: ["Tag1", "Tag2"]
)


