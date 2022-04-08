import Foundation
import SwiftUI

struct ListView: View {
	var body: some View {
		List { 
            NavigationLink(
                destination: AddView()) {
                    ListRowView(title: "doctor information")
            }
        }.navigationTitle("Doctors")
    }
}

struct ListView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			ListView()
		}
	}
}

//struct ListRowView: View {
//	var body: some View {
//		HStack {
//			Image(systemName: "checkmark.circle")
//			Text("Dr. Shledon")
//			Spacer()
//		}
//	}
//}
