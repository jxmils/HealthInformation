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
                    Text("You are signed in")
                    Button(action: {viewModel.signOut()}, label:
                            {Text("Sign Out")
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(7)
                            .padding()
                    })
                }
                
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

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack{
            Image("Logo").resizable().scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            VStack{
                TextField("Email Address", text: $email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color(.secondarySystemBackground)).padding(.bottom)
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.signIn(email: email, password: password)
                },
                       label:{ Text("Sign In").foregroundColor(Color.white)
                        .frame(width: 200, height: 50).background(Color.blue)
                        .cornerRadius(5)
                })
                
                NavigationLink("Create Account", destination: SignUpView())
                    .padding()
            }
            
            Spacer()
        }
        .navigationTitle("Sign In")
    }
}

struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack{
            Image("Screen Shot 2022-03-27 at 6.36.51 PM")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            VStack{
                TextField("Email Address", text: $email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signUp(email: email, password: password)
                },
                       label:{ Text("Create Account").foregroundColor(Color.white)
                        .frame(width: 200, height: 50).background(Color.blue)
                })
                    
            }
            
            Spacer()
        }
        .navigationTitle("Create Account")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
