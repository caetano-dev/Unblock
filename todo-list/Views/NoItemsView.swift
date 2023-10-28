import SwiftUI

struct NoItemsView: View {
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
            VStack(spacing: 10){
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Click the add button to create a new todo")
                NavigationLink(destination: AddView(),
                               label: {
                    Text("Create new todo")
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .clipShape(.buttonBorder)
                })
                .padding(.horizontal, 30)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
                .padding(40)
            
    }
}

struct NoItemsView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationStack{
            NoItemsView().navigationTitle("Title")
        }
    }
}

