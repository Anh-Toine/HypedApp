//
//  DataService.swift
//  Hyped
//
//  Created by Lukas Nguyen on 2022-10-25.
//

import SwiftUI
import UIColorHexSwift
import SwiftDate

class DataService: ObservableObject {

	static var shared = DataService()
	
	@Published var hypeEvents: [HypeEvent] = []
	@Published var discoverHypeEvents: [HypeEvent] = []
	@Published var pastHypeEvents: [HypeEvent] = []
	
	var hypeEventsToAdd: [HypeEvent] = []
	
	func saveData() {
		DispatchQueue.global().async {
			let encoder = JSONEncoder()
			if let encoded = try? encoder.encode(self.hypeEvents) {
				UserDefaults.standard.setValue(encoded, forKey: "hypeEvents")
				UserDefaults.standard.synchronize()
			}
		}
	}
	
	func loadData() {
		DispatchQueue.global().async {
			if let data = UserDefaults.standard.data(forKey: "hypeEvents") {
				let decoder = JSONDecoder()
				if let jsonHypeEvents = try? decoder.decode([HypeEvent].self, from: data) {
					DispatchQueue.main.async {
						self.hypeEvents =  jsonHypeEvents
					}
				}
			}
		}
	}
	
	func getDiscoverEvents() {
		if let url = URL(string: "https://vercheres.github.io/Data/hype_events.json") {
			let request = URLRequest(url: url)
			URLSession.shared.dataTask(with: request) { data, response, error in
				if let webData = data {
					if let json =  try? JSONSerialization.jsonObject(with: webData) as? [[String: String]] {
						
						for jsonHypeEvent in json {
							let hypeEvent = HypeEvent()
							if let id = jsonHypeEvent["id"] {
								hypeEvent.id = id
							}
							if let dateString = jsonHypeEvent["date"] {
								if let dateInRegion = dateString.toDate() {
									// Makes the date consistent based on the region
									hypeEvent.date = dateInRegion.date
								}
							}
							if let title = jsonHypeEvent["title"] {
								hypeEvent.title = title
							}
							if let url = jsonHypeEvent["url"] {
								hypeEvent.url = url
							}
							if let colorHex = jsonHypeEvent["color"] {
								hypeEvent.color = Color(UIColor(colorHex))
							}
							if let imageURL = jsonHypeEvent["imageURL"] {
								if let url = URL(string: imageURL) {
									if let data = try? Data(contentsOf: url) {
										hypeEvent.imageData = data
									}
								}
							}
							self.hypeEventsToAdd.append(hypeEvent)
						}
						DispatchQueue.main.async {
							self.discoverHypeEvents = self.hypeEventsToAdd
						}
					}
				}
			}
			.resume()
		}
		
	}
}
