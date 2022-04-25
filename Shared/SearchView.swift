//
//  SearchView.swift
//  HealthInformation
//
//  Created by 汪大强 on 2022/4/24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var DoctorData: DoctorManager
    @Environment(\.presentationMode) var presentation // 控制页面返回
    @State var doctorSpecialty: String = ""
    @State var isShowAlert = false
    
    @State var searchResultData: [SingleDoctor] = [] // 搜索到的医生数据
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                if searchResultData.count == 0 {
                    VStack {
                        // doctor specialty，doctor office address 和doctor phone number
                        TextField("doctor specialty", text: $doctorSpecialty)
                            .padding(.horizontal)
                            .frame(height: 55)
                            .cornerRadius(10)
                        Divider()
                    }
                } else { // 表示搜索到了医生数据
                    VStack(spacing: 8) {
                        ForEach(searchResultData) { item in
                            HStack {
                                Spacer()
                                    .frame(width:8)
                                ListRowView(singleDoctor: item)
                                    .frame(alignment: .leading)
                                Spacer()
                                Spacer()
                                    .frame(width:8)
                            }
                        }
                    }
                    .padding()
                   
                }
                if searchResultData.count == 0 {
                    Spacer()
                        .frame(height:50)
                    HStack {
                        Button(action: {
                            if self.doctorSpecialty.isEmpty {
                                self.isShowAlert = true
                            } else {
                                // 遍历数据源 查询医生数据
                                let data = self.DoctorData.searchDoctorsBaseInputInfo(info: self.doctorSpecialty)
                                if(data.count == 0) { // 表示没有搜索到
                                    self.isShowAlert = true;
                                } else {
                                    self.searchResultData = [] // 先置空
                                    data.forEach { item in
                                        self.searchResultData.append(item)
                                    }
                                }
                            }
                        }, label: {
                            Text("Search".lowercased())
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                                .cornerRadius(10)
                        })
                    }
                    .padding()
                    .alert(isPresented: self.$isShowAlert) {
                        self.showAlert(title: "Warning", message: self.doctorSpecialty.isEmpty ? "Please input doctor name info." : "NO result Please retry again.")
                    }
                }
                
            }
            .frame(width:UIScreen.main.bounds.width)
            .navigationTitle("Search Doctor")
            .navigationBarItems(leading: Button(action: {
                self.presentation.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Image(systemName: "chevron.backward")
                    Text("Back")
                }
                .foregroundColor(.black)
            }))
        }
    }
    
    func showAlert(title: String, message: String) -> Alert {
        Alert(title: Text(title), message: Text(message))
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
