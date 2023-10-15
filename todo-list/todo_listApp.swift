import SwiftUI

@main
struct todo_listApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
