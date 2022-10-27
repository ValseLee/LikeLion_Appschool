//
//  OlympicFlagView.swift
//  GraphicDrawingPractice
//
//  Created by 이승준 on 2022/10/27.
//

import SwiftUI

struct OlympicFlagView: View {
    var body: some View {
		ZStack {
			GeometryReader { geo in
				
				Circle()
					.trim(from: 50, to: 100)
					.fill(.clear)
					.modifier(CircleModifier())
					.overlay {
						Circle().stroke(Color.blue, lineWidth: 10)
					}
					.position(x: geo.size.width / 5, y: geo.size.height / 5)
				Circle()
					.fill(.clear)
					.modifier(CircleModifier())
					.overlay {
						Circle().stroke(Color.black, lineWidth: 10)
					}
					.position(x: geo.size.width / 2, y: geo.size.height / 5)
				Circle()
					.fill(.clear)
					.modifier(CircleModifier())
					.overlay {
						Circle().stroke(Color.red, lineWidth: 10)
					}
					.position(x: geo.size.width / 1.25, y: geo.size.height / 5)
				Circle()
					.fill(.clear)
					.modifier(CircleModifier())
					.overlay {
						Circle().stroke(Color.green, lineWidth: 10)
					}
					.position(x: geo.size.width / 1.5, y: geo.size.height / 3.7)
				Circle()
					.fill(.clear)
					.modifier(CircleModifier())
					.overlay {
						Circle().stroke(Color.yellow, lineWidth: 10)
					}
					.position(x: geo.size.width / 3, y: geo.size.height / 3.7)
				
			}
		}
    }
}

struct OlympicFlagView_Previews: PreviewProvider {
    static var previews: some View {
        OlympicFlagView()
    }
}

struct CircleModifier: ViewModifier {
	
	func body(content: Content) -> some View {
		content
			.frame(width: 125, height: 100)
	}
}
