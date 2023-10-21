
import SwiftUI

struct PlantView: View {
    var plant: PlantModel

    var body: some View {
        Text(plant.icon)
            .font(.system(size: 48))
            .background(Color.green)
            .cornerRadius(10)
    }
}

struct PlantView_Previews: PreviewProvider {
    static var previews: some View {
        let plant = PlantModel(name: "Sunflower", icon: "🌻")
        return PlantView(plant: plant)
    }
}
