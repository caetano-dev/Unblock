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
                    Text(listRowViewModel.formattedStartDate())
                        .font(.subheadline)
                }
                HStack{
                    Image(systemName: "stopwatch")
                        .font(.subheadline)
                    
                    Text("\(item.durationInMinutes) mins")
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




