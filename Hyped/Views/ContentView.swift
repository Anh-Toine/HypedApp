//
//  ContentView.swift
//  Hyped
//
//  Created by Lukas Nguyen on 2022-10-04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		TabView {
			NavigationView {
				UpcomingView()
					
			}
			.tabItem() {
				Label("Upcoming", systemImage: "calendar")
			}
			NavigationView {
				DiscoverView()
					.navigationTitle("Discover")
			}
				.tabItem() {
					Label("Discover", systemImage: "magnifyingglass")
				}
			NavigationView {
				PastView()
					.navigationTitle("Past")
					.navigationBarTitleDisplayMode(.inline)
			}
				.tabItem() {
					Label("Past", systemImage: "gobackward")
				}
			
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
