//
//  DoctorCell.swift
//  HealthInformation
//
//  Created by 康鹏鹏 on 2022/4/14.
//

import SwiftUI

struct DoctorCell: View {
    @State var doctorSpecialty: String = ""
    @State var doctorOfficeAddress: String = ""
    @State var doctorPhoneNumber: String = ""
    var body: some View {
        VStack {
            Text("Specialty")
//            Text("Add")
//                .foregroundColor(.white)
//                .font(.headline)
//                .frame(height: 50)
//                .frame(maxWidth: .infinity)
//                .background(Color.accentColor)
//                .cornerRadius(10)
        }
        
    }
}

struct DoctorCell_Previews: PreviewProvider {
    static var previews: some View {
        DoctorCell()
    }
}
