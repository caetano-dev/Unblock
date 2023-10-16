import SwiftUI
import Foundation

struct ListRowView: View {
    
    let item: ItemModel
    @EnvironmentObject var listRowViewModel: ListRowViewModel
    
    var body: some View {
        
        HStack{
            
            Image(systemName: item.isCompleted ? "checkmark.square.fill" : "square")
                .scaleEffect(1.5)
                .padding()
                .foregroundStyle(item.isCompleted ? .green : .red)
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title)
                Text(item.description)
                    .font(.subheadline)
            }
            Spacer()
            HStack{
                Text("\(item.startDate)")
                    .font(.subheadline)
                Image(systemName: "stopwatch")
                    .font(.subheadline)
                Text("\(item.durationInMinutes) mins")
                    .font(.subheadline)
               
            }
                
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


struct ListRowView_Previews: PreviewProvider{
    

    static var previews: some View{
        Group{
        ListRowView(item: mockItem)
        }
    }
}


