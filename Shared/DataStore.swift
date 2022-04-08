//
//  DataStore.swift
//  HI
//
//  Created by user216590 on 3/24/22.
// Part of the Checklist code

import Foundation
import SwiftUI
import Combine


struct Task : Identifiable {

    let id : String
    let prescriptionItem : String
    let isChecked : Bool
    
    init( id: String = UUID().uuidString, prescriptionItem: String, isChecked: Bool ){
        self.id = UUID().uuidString
        self.prescriptionItem = prescriptionItem
        self.isChecked = isChecked
        
}//end Task
    
func updateCompletion() -> Task {
   return Task(id: id, prescriptionItem: prescriptionItem, isChecked: !isChecked)    }
}//end updateCompletion

class PrescriptionTask : ObservableObject{
    @Published var tasks = [Task]()
}//end PrescriptionTask






