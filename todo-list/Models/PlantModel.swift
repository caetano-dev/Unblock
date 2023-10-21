import Foundation


struct PlantModel: Identifiable, Codable {
    var id: String
    var name: String
    var icon: String

    init(id: String = UUID().uuidString, name: String, icon: String){
        self.id = id
        self.name = name
        self.icon = icon
    }
    
}

let plantsMock: [PlantModel] = [
    
    
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Sunflower", icon: "🌻"),
    PlantModel(name: "Rose", icon: "🌹"),
    PlantModel(name: "Tulip", icon: "🌷"),
    PlantModel(name: "Sunflower", icon: "🌻"),
]

