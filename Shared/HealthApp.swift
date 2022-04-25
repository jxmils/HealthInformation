//
//  HealthInformationApp.swift
//  Shared
//
//  Created by Ruben Camargo on 3/2/22.
//

import SwiftUI
import Firebase


@main
struct HealthApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}

var formatter = DateFormatter()
func initDoctorData() -> [SingleDoctor] {
    
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    var output: [SingleDoctor] = []
    if let dataStored = UserDefaults.standard.object(forKey: "DoctorListData") as? Data {
        let data = try! decoder.decode([SingleDoctor].self, from: dataStored)
        for item in data {
            if !item.deleted {
                output.append(SingleDoctor(specialty: item.specialty, officeAddress: item.officeAddress, phoneNumber: item.phoneNumber, addDudate: item.addDudate, id: output.count))
            }
        }
    }
    return output
}
