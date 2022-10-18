//
//  HypeEvent.swift
//  Hyped
//
//  Created by Lukas Nguyen on 2022-10-04.
//

import SwiftUI

class HypeEvent: ObservableObject {
	
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
