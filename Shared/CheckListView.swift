//
//  CheckListView.swift
//  HI
//
//  Created by Liliana Hernandez on 3/27/22.
//
//Prescription Checklist code
import Foundation
import SwiftUI
import Combine

struct CheckListView: View {
    
    @ObservedObject var prescriptionTask = PrescriptionTask()
    @State var newPrescription : String = ""

    var search : some View{
        HStack {
            TextField("Enter a new prescription", text: self.$newPrescription)
            Button(action: self.addNewPrescription, label: { Text("Add New").bold()}) //added a button to add more prescriptions
        }
    }
    
    //function that adds a new prescription to the prescription array
    func addNewPrescription(){
        prescriptionTask.tasks.append(Task(id: String(prescriptionTask.tasks.count + 1), prescriptionItem: newPrescription, isChecked: false))
        self.newPrescription = ""
        
    }//end addNewPrescription function

    var body: some View {
          VStack{
              search.padding()
              List{
                  ForEach(self.prescriptionTask.tasks){
                      task in
                        HStack{
                          Text(task.prescriptionItem )
                          Spacer()
                            Image(systemName: task.isChecked  ? "checkmark.circle" : "circle").foregroundColor(task.isChecked ? Color.green : Color.red).onTapGesture{
                                    updateCheckMark(item: task)
                                }//end onTapGesture
                        }//end HStack
                  }.onMove(perform: self.move).onDelete(perform:self.delete)
              }.listStyle(PlainListStyle()).navigationBarTitle("Prescriptions💊").navigationBarItems(trailing: EditButton())
       }//end VStack
 }//end body
    
    func move(from source: IndexSet, to destination : Int){
        prescriptionTask.tasks.move(fromOffsets: source, toOffset: destination)
    }//delete
                                                               
    func delete(at offsets: IndexSet){
        prescriptionTask.tasks.remove(atOffsets: offsets)
    }//end delete
    
    func updateCheckMark(item: Task){
        if let i = prescriptionTask.tasks.firstIndex( where: {$0.id == item.id} ){
            prescriptionTask.tasks[i] = item.updateCompletion()
        }
      }//end updateCheckMark
    
struct CheckListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
           CheckListView()
        }//end NavigationView
    }//end previewa
}//end CheckListView_Prewview
            
}//end CheckListView
                                                               
