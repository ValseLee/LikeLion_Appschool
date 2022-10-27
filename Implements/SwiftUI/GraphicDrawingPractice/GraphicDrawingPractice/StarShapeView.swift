//
//  StarShapeView.swift
//  GraphicDrawingPractice
//
//  Created by 이승준 on 2022/10/27.
//

import SwiftUI

struct StarShapeView: View {
    var body: some View {
		GeometryReader { geo in
			let centerWidth = geo.size.width / 2
			let centerHeight = geo.size.height / 2
			
			StartShape(centerWidth: centerWidth - 100,
					   centerHeight: centerHeight,
					   firstPoint: 150,
					   secondPoint: 30).fill(Color.orange)
			
			StartShape(centerWidth: centerWidth + 50,
					   centerHeight: centerHeight + 30,
					   firstPoint: 75,
					   secondPoint: 15).fill(Color.yellow)
			
			StartShape(centerWidth: centerWidth + 10,
					   centerHeight: centerHeight - 50,
					   firstPoint: 100,
					   secondPoint: 20).fill(Color.yellow.opacity(0.8))
				.rotationEffect(.degrees(30))
			
			StartShape(centerWidth: centerWidth - 30,
					   centerHeight: centerHeight + 150,
					   firstPoint: 50,
					   secondPoint: 10).fill(Color.blue)
				.rotationEffect(.degrees(5))
			
			StartShape(centerWidth: centerWidth - 40,
					   centerHeight: centerHeight - 240,
					   firstPoint: 125,
					   secondPoint: 25)
			.rotationEffect(.degrees(30))
		}
    }
}

struct StarShapeView_Previews: PreviewProvider {
    static var previews: some View {
        StarShapeView()
    }
}

struct StartShape: Shape {
	let centerWidth: CGFloat
	let centerHeight: CGFloat
	
	let firstPoint: CGFloat
	let secondPoint: CGFloat
	
	func path(in rect: CGRect) -> Path {
		var path = Path()
		path.move(to: CGPoint(x: centerWidth,
							  y: centerHeight))
		path.addLines([
			// upward
			CGPoint(x: centerWidth - firstPoint, y: centerHeight),
			CGPoint(x: centerWidth - firstPoint / 6, y: centerHeight - firstPoint / 6),
			CGPoint(x: centerWidth, y: centerHeight - firstPoint),
			CGPoint(x: centerWidth + firstPoint / 6, y: centerHeight - firstPoint / 6),
			CGPoint(x: centerWidth + firstPoint, y: centerHeight),
			
			// downward
			CGPoint(x: centerWidth + firstPoint / 3, y: centerHeight + firstPoint / 6),
			CGPoint(x: centerWidth + secondPoint * 3, y: centerHeight + firstPoint),
			CGPoint(x: centerWidth, y: centerHeight + firstPoint / 3),
			CGPoint(x: centerWidth - secondPoint * 3, y: centerHeight + firstPoint),
			CGPoint(x: centerWidth - firstPoint / 3, y: centerHeight + firstPoint / 6),
		])
		path.closeSubpath()
		return path
	}
}
//
//Path { path in
//	path.move(to: CGPoint(x: centerWidth,
//						  y: centerHeight))
//	path.addLines([
//		CGPoint(x: centerWidth - 150, y: centerHeight),
//		CGPoint(x: centerWidth - 30, y: centerHeight - 30),
//		CGPoint(x: centerWidth, y: centerHeight - 150),
//		CGPoint(x: centerWidth + 30, y: centerHeight - 30),
//		CGPoint(x: centerWidth + 150, y: centerHeight),
//		CGPoint(x: centerWidth + 50, y: centerHeight + 30),
//		CGPoint(x: centerWidth + 80, y: centerHeight + 150),
//		CGPoint(x: centerWidth, y: centerHeight + 50),
//		CGPoint(x: centerWidth - 80, y: centerHeight + 150),
//		CGPoint(x: centerWidth - 50, y: centerHeight + 30),
//	])
//	path.closeSubpath()
//	}.fill(Color.black)
