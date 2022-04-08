//
//  CustomDatePIcker.swift
//  Test (iOS)
//
//  Created by Jason Miller on 3/28/22.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @Binding var currentDate: Date
    
    //month update on arrow button
    @State var currentMonth: Int = 0
    
    var body: some View {
        
        VStack(alignment: .leading , spacing: 20){
            
            //days
            let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
            
            
            HStack{
                
                VStack(alignment: .leading, spacing: 5){
                    
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extraDate()[1])
                        .font(.title.bold())
  
                }
                
                Spacer(minLength: 0)
                
                Button{
                    withAnimation{
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                Button {
                    withAnimation{
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            
            .padding(.horizontal)
            
            //day view
            HStack(spacing: 0){
                ForEach(days, id: \.self){ day in
                    
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                
            }
            
            //dates
            //grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15) {
                
                ForEach(extractDate()){value in
                    
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color.pink)
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1: 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                    
                }
                
            }
            
            VStack(spacing: 15){
                
                Text("Prescriptions")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                if let prescription = prescriptions.first(where: { prescription in
                    return isSameDay(date1: prescription.prescriptionDate, date2: currentDate)
                }){
                    
                    ForEach(prescription.prescription){prescription in
                        VStack(alignment: .leading, spacing: 10) {
                            
                            //for custom timing
                            Text(prescription.time
                                    .addingTimeInterval(CGFloat
                                                            .random(in: 0...5000)), style:
                                    .time)
                            Text(prescription.title)
                                .font(.title2.bold())
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            Color.purple
                                .opacity(0.5)
                                .cornerRadius(10)
                        )
                    }
                    
                }
                else {
                    Text("No Prescriptions Found")
                }
            }
            .padding()
            .padding(.top, 25)
            
        }
        
        .onChange(of: currentMonth){ newValue in
            
            //updating month
            currentDate = getCurrentMonth()
            
        }
        
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        
        VStack {
            
            if value.day != -1{
                
                if let prescription = prescriptions.first(where: { prescription in
                    
                    return isSameDay(date1: prescription.prescriptionDate, date2: currentDate)
                    
                
                }) {
                    
                    Text("\(value.day)")
                        .font(.title3.bold())
                        //.foregroundColor(isSameDay(date1: prescription.prescriptionDate, date2: currentDate) ? .white: .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: prescription.prescriptionDate, date2: currentDate) ? .white: Color.pink)
                        .frame(width: 8, height: 8)
                }
                else {
                    
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white: .primary)
                        .frame(maxWidth: .infinity)
    
                    Spacer()
                    
                }
            }
            
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
        
    }
        
    //check dates
    func isSameDay(date1: Date, date2: Date)->Bool{
        
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
        
    }
    
    //year and month for display
    func extraDate()->[String]{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth()->Date {
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else{
            
            return Date()
            
        }
        
        return currentMonth
    }
    
    func extractDate() ->[DateValue] {
        //getting current month
        let calendar = Calendar.current
        
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            
            //getting day
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
            
        }
        
        //adding offset days to get exact week day
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            
            days.insert(DateValue(day: -1, date: Date()), at: 0)
            
        }
        
        return days
        
    }
    
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//extending dates to get current month dates
extension Date{
    
    func getAllDates()->[Date]{
        
        let calendar = Calendar.current
        
        //getting start date
         let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!

        return range.compactMap{ day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
            
        }
    }
}
