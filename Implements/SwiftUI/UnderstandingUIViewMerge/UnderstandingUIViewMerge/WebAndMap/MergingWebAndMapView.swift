//
//  MergingWebView.swift
//  UnderstandingUIViewMerge
//
//  Created by 이승준 on 2022/11/02.
//

import SwiftUI

struct MergingWebAndMapView: View {
	var body: some View {
		TabView {
			Text("Main WebView").tabItem {
				Image(systemName: "safari")
				Text("Web View")
			}
			
			Text("???").tabItem {
				Image(systemName: "map")
				Text("Map")
			}
		}
	}
}

struct MergingWebAndMapView_Previews: PreviewProvider {
	static var previews: some View {
		MergingWebAndMapView()
	}
}
