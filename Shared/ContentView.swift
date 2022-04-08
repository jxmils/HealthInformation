//
//  ContentView.swift
//  Shared
//
//  Created by Ruben Camargo on 3/27/22.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject{
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email,
                    password: password) { [weak self]result, error in
            guard result != nil , error == nil else {
                return
            }
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) { [weak self]result, error in
            guard result != nil , error == nil
            else { return}
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView{
            if viewModel.signedIn{
                VStack{
                    
                        NavigationLink("Prescriptions", destination: CheckListView())
                            .padding()
                            
                        
                        NavigationLink("Calendar", destination: Home())
                            .padding()
                        
                        NavigationLink("Doctor Information", destination: ListView())
                            .padding()
                    
                    Button(action: {viewModel.signOut()}, label:
                            {Text("Sign Out")
                            .frame(width: 200, height: 50)
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(7)
                            .padding()
                    })
                }.background(Color(.secondarySystemBackground))
                .navigationTitle("Home Page")
                
            }
            else {
                SignInView()
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
