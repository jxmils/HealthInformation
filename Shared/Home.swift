//
//  Home.swift
//  Test (iOS)
//
//  Created by Jason Miller on 3/28/22.
//

import SwiftUI


struct Home: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing:20){
                //custom date picker
                CustomDatePicker(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
        //Safe Area View
        .safeAreaInset(edge: .bottom){
            
            HStack{
                
                Button {
                    
                    
                } label: {
                    
                    Text("Add Prescription")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange, in: Capsule())
                    
                }
                
                Button {
                    
                    
                } label: {
                    
                    Text("Add Refill")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color.purple, in: Capsule())
                    
                }
                
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
