import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(.buttonBorder)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save")
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .clipShape(.buttonBorder)
                })
                
            }.padding(14)
        }.navigationTitle("Add an item")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
        
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3 {
            alertTitle = "Your to-do needs to be at least 3 characters long."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }.environmentObject(ListViewModel())
}
