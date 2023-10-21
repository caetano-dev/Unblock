import SwiftUI

struct GardenView: View {
    

    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 10) {
                ForEach(plantsMock, id: \.id) { plant in
                    PlantView(plant: plant)
                }
            }.padding(20)
        }
        
    }
}



#Preview {
    GardenView()
}
