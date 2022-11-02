//
//  MapTabView.swift
//  UnderstandingUIViewMerge
//
//  Created by 이승준 on 2022/11/02.
//

import SwiftUI
import MapKit

struct AnnotatedItem: Identifiable {
	let id = UUID()
	let name: String
	let coordination: CLLocationCoordinate2D
}

struct MapTabView: View {
	@State private var coordinateRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.276803, longitude: 127.129222), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
	
	var pointArray: [AnnotatedItem] = [
		AnnotatedItem(name: "random", coordination: .init(latitude: 37.276803, longitude: 127.129222)),
					  AnnotatedItem(name: "random", coordination:
		.init(latitude: 37.000000, longitude: 120.000000)),
	]
	
	
    var body: some View {
		Map(coordinateRegion: $coordinateRegion,
			annotationItems: pointArray) { item in
			MapMarker(coordinate: item.coordination, tint: .purple)
		}
    }
}

struct MapTabView_Previews: PreviewProvider {
    static var previews: some View {
        MapTabView()
    }
}
