//
//  HypeEvent.swift
//  Hyped
//
//  Created by Lukas Nguyen on 2022-10-04.
//

import SwiftUI

class HypeEvent: ObservableObject, Identifiable {
	
	var id = UUID().uuidString
	var date = Date()
	var title = ""
	var url = ""
	var color = Color.purple
	@Published var imageData: Data?
	
	func image() -> Image? {
		if let data = imageData {
			if let uiImage = UIImage(data: data) {
				return Image(uiImage: uiImage)
			}
		}
		return nil
	}
}

// Test data with image
var testHypeEent1: HypeEvent {
	let hypeEvent = HypeEvent()
	
	if let image = UIImage(named: "buenos_aires") {
		if let data = image.pngData() {
			hypeEvent.imageData = data
		}
	}
	hypeEvent.title = "Family trip to Buenos Aires"
	hypeEvent.color = .blue
	hypeEvent.date = Date()
	hypeEvent.url = "capybararg.com"
	
	return hypeEvent
}

// Test data without image
var testHypeEent2: HypeEvent {
	let hypeEvent = HypeEvent()
	
	hypeEvent.title = "Solo trip to Sherbrooke"
	hypeEvent.color = .orange
	hypeEvent.date = Date()
	
	return hypeEvent
}
