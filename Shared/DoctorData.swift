//
//  DoctorData.swift
//  HealthInformation
//
//  Created by 汪大强 on 2022/4/24.
//

import Foundation


var encoder = JSONEncoder()
var decoder = JSONDecoder()

class DoctorManager: ObservableObject {
    @Published var DoctorList: [SingleDoctor]
    var count = 0
    
    init() {
        self.DoctorList = []
    }
    // 初始化数据
    init(data: [SingleDoctor]) {
        self.DoctorList = []
        for item in data {
            self.DoctorList.append(SingleDoctor(specialty: item.specialty, officeAddress: item.officeAddress, phoneNumber: item.phoneNumber, addDudate: item.addDudate, id: self.count))
            count += 1
        }
    }
    
    func check(id: Int) {
//        self.DoctorList[id].isChecked.toggle()
        self.dataStore()
    }
    
    /// 添加数据
    func add(data: SingleDoctor) {
        self.DoctorList.append(SingleDoctor(specialty: data.specialty, officeAddress: data.officeAddress, phoneNumber: data.phoneNumber, addDudate: data.addDudate, id: self.count))
        self.count += 1
        
        self.sort()
        
        self.dataStore()
    }
    
    /// 编辑数据
    func edit(id: Int, data: SingleDoctor) {
        self.DoctorList[id].specialty = data.specialty
        self.DoctorList[id].officeAddress = data.officeAddress
        self.DoctorList[id].addDudate = data.addDudate
        self.DoctorList[id].phoneNumber = data.phoneNumber
        
        self.sort()
        
        self.dataStore()
    }
    
    /// 删除数据根据下标
    func delete(id: Int) {

        self.DoctorList[id].deleted = true
        self.sort()
        
        self.dataStore()
    }
    
    // list删除指定的数据
    func deleteIndexSet(id: IndexSet) {
        self.DoctorList.remove(atOffsets: id)
        
        self.sort()
        
        self.dataStore()
    }
    
    // 根据指定的信息搜索医生
    func searchDoctorsBaseInputInfo(info: String)  -> [SingleDoctor]{
        if info.isEmpty { // 表示为空
            return []
        }
        
        var resultData: [SingleDoctor] = []
        
        self.DoctorList.forEach { doctor in
            if doctor.specialty .contains(where: info.contains) {
                resultData.append(doctor)
            }
        }
        return resultData
    }
    
    //MARK: 相比于视频，这里进行了更改；在SwiftUI中，尽量不要修改元素的id，因为id是区分不同View的方式，更改id会导致一些奇怪的（特别是动画上的）问题；
    func sort() {
        self.DoctorList.sort(by: {(data1, data2) in
            return data1.addDudate.timeIntervalSince1970 > data2.addDudate.timeIntervalSince1970
        })
    }
    
    /// 存储数据
    func dataStore() {
        print(self.DoctorList)
        let dataStored = try! encoder.encode(self.DoctorList)
        UserDefaults.standard.set(dataStored, forKey: "DoctorListData")
    }
    
}



/// 医生模型
struct SingleDoctor: Identifiable, Codable {
    
    var specialty: String
    var officeAddress: String
    var phoneNumber: String
    var addDudate: Date = Date() // 添加时间
    var deleted = false
    
    var id: Int = 0
}

