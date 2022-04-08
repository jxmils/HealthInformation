import SwiftUI

struct AddView: View {

	@State var doctorSpecialty: String = ""
    @State var doctorOfficeAddress: String = ""
    @State var doctorPhoneNumber: String = ""
    @State var isShowAlert = false
	var body: some View {
		ScrollView {
			VStack {
                // doctor specialty，doctor office address 和doctor phone number
                TextField("doctor specialty", text: $doctorSpecialty)
                    .padding(.horizontal)
                    .frame(height: 55)
                    //.background(Color())
                    .cornerRadius(10)
                Divider()
                
                TextField("doctor office address", text: $doctorOfficeAddress)
                    .padding(.horizontal)
                    .frame(height: 55)
                    //.background(Color())
                    .cornerRadius(10)
                Divider()
                
                TextField("doctor phone number", text: $doctorPhoneNumber)
                    .padding(.horizontal)
                    .frame(height: 55)
                    //.background(Color())
                    .cornerRadius(10)
            }
            Button(action: {
                self.isShowAlert = true
            }, label: {
                Text("Save".lowercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            })
            .alert(isPresented: self.$isShowAlert) {
                Alert(title: Text("SUCCESS"), message: Text("\(doctorSpecialty)\n\(doctorOfficeAddress)\n\(doctorPhoneNumber)"))
            }
            .navigationTitle("Add Doctors: ")
            
        }
	}
}

struct AddView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			AddView()
		}
	}
}
