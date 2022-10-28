//
//  UpcomingView.swift
//  Hyped
//
//  Created by Lukas Nguyen on 2022-10-04.
//

import SwiftUI

struct UpcomingView: View {
	@ObservedObject var data = DataService.shared

	//var hypeEvents: [HypeEvent] = []
	@State var showingCreateView: Bool = false
	
	var body: some View {
		ScrollView {
			VStack {
				
				if data.hypeEvents.count == 0 {
					Text("Nothing to look forward to \n Create an event or check out the Discover tab!")
						.multilineTextAlignment(.center)
				} else {
					ForEach(data.hypeEvents) { hypeEvent in
						TileView(hypeEvent: hypeEvent)
					}
				}
			}
		}
		.navigationTitle("Upcoming")
		.navigationBarItems(trailing: Button(action: {showingCreateView = true}) {
			Image(systemName: "calendar.badge.plus")
				.font(.title)
		}
			.sheet(isPresented: $showingCreateView) {
				CreateHypeEventView()
			})
	}
}
struct UpcomingView_Previews: PreviewProvider {
	static var previews: some View {
		UpcomingView()
	}
}
