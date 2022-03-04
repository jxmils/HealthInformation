//
//  ContentView.swift
//  Shared
//
//  Created by Ruben Camargo on 3/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
                    VStack(spacing: 0) {
                        HStack() {
                            Image("Screen Shot 2022-03-01 at 7.05.36 PM")
                                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                                .frame(width: 90.0, height: 100.0)

                        }
                        .padding()
                        .offset(y: 0)
                        .frame(minWidth: 0, maxHeight: 150, alignment: .center)

                        VStack {
                            Text("Enter Username")
                                .fontWeight(.light)
                                .font(.title).foregroundColor(Color.white)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                                .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)).background(Color.cyan)
                                

                            
                        }
                        .frame(width: 360.0
                               , height: 80.0)
                        VStack{
                            Text("Enter Password")
                                .fontWeight(.light)
                                .font(.title)
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50).background(Color.cyan)
                        }
                    }
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .offset(x: 0, y: 0)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
