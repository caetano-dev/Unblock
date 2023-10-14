import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


struct ListRowView_Previews: PreviewProvider{
    static var item1 = ItemModel(title: "first item", isCompleted: false)
    static var previews: some View{
        Group{
        ListRowView(item: item1)
        }
    }
}


