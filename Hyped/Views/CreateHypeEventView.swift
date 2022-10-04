//
//  CreateHypeEventView.swift
//  Hyped
//
//  Created by Lukas Nguyen on 2022-10-04.
//

import SwiftUI

struct CreateHypeEventView: View {
	
	@StateObject var hypeEvent = HypeEvent()
	
    var body: some View {
		Form {
			
			Section {
				FormLabelView(title: "Title", iconName: "keyboard", color: .green)
				TextField("Family Vacation", text: $hypeEvent.title)
					.autocapitalization(.words)
			}
			Section {
				FormLabelView(title: "Date", iconName: "calendar")
				DatePicker("Date", selection: $hypeEvent.date, displayedComponents: [.date, .hourAndMinute])
					.datePickerStyle(GraphicalDatePickerStyle())
			}
			Section {
				
				ColorPicker(selection: $hypeEvent.color) {
					FormLabelView(title: "Color", iconName: "eyedropper", color: .yellow)
				}
			}
			Section {
				FormLabelView(title: "Website", iconName: "link", color: .orange)
				TextField("https://amazon.com", text: $hypeEvent.url)
					.autocapitalization(.none)
					.keyboardType(.URL)
			}
		}
    }
}

struct CreateHypeEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHypeEventView()
    }
}
