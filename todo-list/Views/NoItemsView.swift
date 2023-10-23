import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
            VStack(spacing: 10){
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Click the add button to create a new todo")
                NavigationLink(destination: AddView(selectedItem: mockItem),
                               label: {
                    Text("Create new todo")
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                })
                .padding(.horizontal, 30)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
            
    }
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
            withAnimation(
                Animation.easeInOut(duration: 0.5)
            ){
                animate.toggle()
            }
        }
        
    }
}

struct NoItemsView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationStack{
            NoItemsView().navigationTitle("Title")
        }
    }
}

