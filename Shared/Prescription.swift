//
//  Prescription.swift
//  Test (iOS)
//
//  Created by Jason Miller on 3/28/22.
//

import SwiftUI

struct Prescription: Identifiable{
    
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
    
}

struct PrescriptionMetaData: Identifiable {
    
    var id = UUID().uuidString
    var prescription: [Prescription]
    var prescriptionDate: Date
    
}

//sample dates for testing
func getSampleDate(offset: Int)->Date{
    
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
    
}

//sample prescriptions
var prescriptions: [PrescriptionMetaData] = [
    
    PrescriptionMetaData(prescription: [
    
        Prescription(title: "Ibuprofen"),
        Prescription(title: "Atorvastatin"),
        Prescription(title: "Amoxicillin")
    
    ], prescriptionDate: getSampleDate(offset: 1))

]
