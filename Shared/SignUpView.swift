//
//  SignUpView.swift
//  Health
//
//  Created by Ruben Camargo on 4/7/22.
//

import Foundation
import SwiftUI


struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack{
            VStack{
                Text("").padding(.init(top: 10, leading: 100, bottom: 10, trailing: 100))
                
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
