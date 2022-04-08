//
//  SignInView.swift
//  Health
//
//  Created by Ruben Camargo on 4/7/22.
//

import Foundation
import SwiftUI

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
