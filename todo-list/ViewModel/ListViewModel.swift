import Foundation

class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "this is 1", isCompleted: false),
            ItemModel(title: "this is 2", isCompleted: true),
            ItemModel(title: "this is 3", isCompleted: false),
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
}
