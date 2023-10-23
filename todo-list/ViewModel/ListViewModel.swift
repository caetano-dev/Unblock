import Foundation

class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems() {
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey) ,
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(newItem: ItemModel) {
        let newItem = ItemModel(title: newItem.title, description: newItem.description, isCompleted: false, startDate: newItem.startDate, endDate: newItem.endDate, createdAt: newItem.createdAt, isHabit: newItem.isHabit, location: newItem.location, attendees: newItem.attendees, recurrence: newItem.recurrence, colorCategory: newItem.colorCategory, notes: newItem.notes, priority: newItem.priority, url: newItem.url, isAllDay: newItem.isAllDay, organizer: newItem.organizer, status: newItem.status, tags: newItem.tags)

        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
        
    }
}
