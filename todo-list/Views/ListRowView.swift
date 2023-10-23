import SwiftUI
import Foundation

struct ListRowView: View {
    
    let item: ItemModel
    let listRowViewModel: ListRowViewModel
    init(item: ItemModel){
        self.item = item
        listRowViewModel = ListRowViewModel(item: item)
    }
    
    var body: some View {
        HStack(alignment:.top){
            Image(systemName: item.isCompleted ? "checkmark.square.fill" : "square")
                .scaleEffect(1.5)
                .padding()
                .foregroundStyle(item.isCompleted ? .green : .red)
            
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title)
                
                Text(item.description)
                    .font(.subheadline)
                HStack{
                    Image(systemName: "calendar")
                        .font(.subheadline)
                    Text("\(item.startDate.hour ?? 0):\(item.startDate.minute ?? 0)")
                        .font(.subheadline)
                    Text("\(item.startDate.day ?? 0)/\(item.startDate.month ?? 0)")
                        .font(.subheadline)
                    Text("-")
                        .font(.subheadline)
                    Text("\(item.endDate.hour ?? 0):\(item.endDate.minute ?? 0)")
                        .font(.subheadline)
                    Text("\(item.endDate.day ?? 0)/\(item.endDate.month ?? 0)")
                        .font(.subheadline)
                }
            }
        }
    }
}


struct ListRowView_Previews: PreviewProvider{
    static var previews: some View{
        Group{
            ListRowView(item: mockItem)
        }.previewLayout(.sizeThatFits)
    }
}




