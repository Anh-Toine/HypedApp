//
//  CreateHypeEventView.swift
//  Hyped
//
//  Created by Lukas Nguyen on 2022-10-04.
//

import SwiftUI
import UIKit

struct CreateHypeEventView: View {
	
	@StateObject var hypeEvent = HypeEvent()
	@State var showTime = false
	@State var showImagePicker = false
	
	var body: some View {
		Form {
			
			Section {
				FormLabelView(title: "Title", iconName: "keyboard", color: .green)
				TextField("Family Vacation", text: $hypeEvent.title)
					.autocapitalization(.words)
			}
			Section {
				FormLabelView(title: "Date", iconName: "calendar")
				DatePicker("Date", selection: $hypeEvent.date, displayedComponents: showTime ? [.date, .hourAndMinute] : [.date])
					.datePickerStyle(GraphicalDatePickerStyle())
				
				Toggle(isOn: $showTime) {
					FormLabelView(title: "Time", iconName: "clock.fill")
				}
				.tint(.blue)
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
			Section {
				if hypeEvent.imageData != nil {
					HStack {
						FormLabelView(title: "Image", iconName: "camera", color: .purple)
						Spacer()
						
						Button(action: {
							hypeEvent.imageData = nil
						}) {
							Text("Delete image")
								.foregroundColor(Color(.red))
						}
					}
					Button(action: {
						showImagePicker = true
					}) {
						hypeEvent.image()!
							.resizable()
							.aspectRatio(contentMode: .fit)
					}
					
				} else {
					HStack {
						FormLabelView(title: "Image", iconName: "camera", color: .purple)
						Spacer()
						Button(action: {
							showImagePicker = true
						}) {
							Text("Pick an Image")
						}
					}
				}
			}
			.sheet(isPresented: $showImagePicker) {
				ImagePicker(imageData: $hypeEvent.imageData)
			}
		}
		
	}
}

struct CreateHypeEventView_Previews: PreviewProvider {
	static var previews: some View {
		CreateHypeEventView()
	}
}
