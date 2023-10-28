import SwiftUI

@main
struct todo_listApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            NavigationStack{
                TabView {
                    ListView()
                        .tabItem { Label("Tasks", systemImage: "checkmark.square") }
                    GardenView()
                        .tabItem{
                            Label("Garden", systemImage: "tree")
                        }
                    
                }.toolbar{
                        ToolbarItem(placement: .topBarTrailing){
                            NavigationLink(destination: AddView()){
                                Image(systemName: "plus.circle")
                            }
                        }
                    }
                
            }.environmentObject(listViewModel)
        }
    }
}
