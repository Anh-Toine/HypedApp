//
//  UpcomingView.swift
//  Hyped
//
//  Created by Lukas Nguyen on 2022-10-04.
//

import SwiftUI

struct UpcomingView: View {
	
	@State var showingCreateView: Bool = false
	
	var body: some View {
		Text("Upcoming view")
			.navigationTitle("Upcoming")
			.navigationBarItems(trailing: Button(action: {showingCreateView = true}) {
				Image(systemName: "calendar.badge.plus")
					.font(.title)
			}
			.sheet(isPresented: $showingCreateView) {
				CreateHypeEventView()
			})
	}
		
	
	struct UpcomingView_Previews: PreviewProvider {
		static var previews: some View {
			UpcomingView()
		}
	}
}
