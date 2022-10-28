//
//  DiscoverView.swift
//  Hyped
//
//  Created by Lukas Nguyen on 2022-10-04.
//

import SwiftUI

struct DiscoverView: View {
	@ObservedObject var data: DataService = DataService.shared

    var body: some View {
		ScrollView {
			VStack {
				if data.discoverHypeEvents.count == 0 {
					Text("Nothing here it seems...")
						.multilineTextAlignment(.center)
				} else {
					ForEach(data.discoverHypeEvents) { hypeEvent in
						TileView(hypeEvent: hypeEvent)
					}
				}
			}
		}
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
