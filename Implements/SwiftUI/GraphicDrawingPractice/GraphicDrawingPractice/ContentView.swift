//
//  ContentView.swift
//  GraphicDrawingPractice
//
//  Created by 이승준 on 2022/10/27.
//	3D 그래픽으로 그리고 싶다면 Game 을 골라야 할 수도 있다.
//	가상현실과 증강현실 앱도 따로 있다!
//	fill 과 foregroundColor를 잘 구별해서 써야 한다.
//	적어도 Shape에서 색을 '채워야 한다' 면 fill을 쓰고, strokeColor를 칠하려면 overlay로 동일한 Shape을 전달한다.

import SwiftUI

struct ContentView: View {
    var body: some View {
		VStack {
//			Group {
//				Text("Hello, Rectangle!")
//				Rectangle()
//
//				Text("Hello, Circle!")
//				Circle()
//					.fill(Color.purple)
//					.overlay {
//						Circle().stroke(Color.black, lineWidth: 5)
//					}
//					.frame(width: 200, height: 200)
//
//				Text("Hello, Capsule")
//				Capsule()
//					.stroke(lineWidth: 10)
//					.foregroundColor(.blue)
//					.frame(width: 200, height: 100)
//
//				Text("Hello, RoundRectangle")
//				RoundedRectangle(cornerRadius: CGFloat(20))
//					.stroke(style: StrokeStyle(lineWidth: CGFloat(5), dash: [CGFloat(10), CGFloat(5)]))
//
//				Text("Hello Ellipse")
//				Ellipse()
//					.stroke(style: StrokeStyle(lineWidth: 20, dash: [CGFloat(10), CGFloat(5), CGFloat(2)], dashPhase: CGFloat(10)))
//					.foregroundColor(.blue)
//					.frame(width: 250, height: 150)
//			}.tag("Shape집합")
			
			Group {
				Path { path in
					path.move(to: CGPoint(x: 10, y: 0))
					path.addLine(to: CGPoint(x: 10, y: 150))
					path.addLine(to: CGPoint(x: 300, y: 300))
					path.closeSubpath()
				}
				
				MyShape().fill(Color.orange)
			}
		}
		.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyShape: Shape {
	func path(in rect: CGRect) -> Path {
		var path = Path()
		path.move(to: CGPoint(x: 10, y: 0))
		path.addLine(to: CGPoint(x: 10, y: 150))
		path.addLine(to: CGPoint(x: 300, y: 300))
		path.closeSubpath()
		return path
	}
}
