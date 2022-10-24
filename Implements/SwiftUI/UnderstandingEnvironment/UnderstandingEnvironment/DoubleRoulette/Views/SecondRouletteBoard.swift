//
//  SecondRouletteBoard.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import SwiftUI

struct SecondRouletteBoard : View {
	
	@Binding var userNumber: Int
	@Binding var rotation: Int
	@Binding var opacity: CGFloat
	
	var lunchMenus: [String] = ["부대찌개", "돈까스", "불백", "김치찜", "마카롱", "육개장", "짜장면", "초밥", "스파게티", "삼겹살"]
	
	var color: [Color] = [
		.red, .yellow, .gray, .blue, .pink, .purple, .brown, .indigo, .green, .orange, .teal
	]
	
	func getCurrentIndex(rotation: Int, userNumber: Int) -> Int {
		
		//돌아가는 각도의 범위가 3600까지 이므로 % 360 으로 회전각도를 구하고
		//270도에서 빼줘서 화살표가 가르키는곳의 각도를 구한다.
		var offsetRotation: Int = 270 - rotation % 360
		
		//이때 마이너스인 경우에는 360도에서 빼줘서 그 각도를 구한다
		if offsetRotation < 0 {
			offsetRotation = 360 + offsetRotation
		}
		
		var index: Int = 0
		
		//돌아간 각도에서 조각의 각도만큼 반복적으로 빼주어 화살표가 가르키는 인덱스가 몇 번째인지 구한다.
		while offsetRotation > 0 {
			index += 1
			offsetRotation -= Int(360/userNumber)
		}
		//구한 값에서 1을 빼준다(배열에 접근하기 위해)
		return (index - 1)
	}
	
	
	
	
	var body: some View {
		GeometryReader { geo in
			let centerWidth: CGFloat = geo.size.width / 2
			let centerHeight: CGFloat = geo.size.height / 2
			ZStack {
				Circle()
					.frame(width: 320, height: 320)
				ForEach(1 ..< userNumber + 1) { index in
					let eachArcStartAngle: Double = Double(360 / userNumber * (index - 1))
					let eachArcEndAngle: Double = Double(360 / userNumber * (index))
					let middleAngle: Double = (eachArcStartAngle + eachArcEndAngle) / 2
					
					
					Path { path in
						path.move(to: CGPoint(x: centerWidth, y: centerHeight))
						path.addArc(center: .init(x: centerWidth, y: centerHeight),
									radius: 150,
									startAngle: Angle(degrees: eachArcStartAngle),
									endAngle: Angle(degrees: eachArcEndAngle),
									clockwise: false)
					}
					.fill(color[index - 1])
					.overlay {
						Text(self.lunchMenus[index - 1])
							.offset(x: 100 * cos(middleAngle * Double.pi / 180),
									y: 100 * sin(middleAngle * Double.pi / 180))
						
					}
				}
				.rotationEffect(.degrees(Double(self.rotation)))
				.animation(.timingCurve(0, 0.8, 0.2, 1, duration:10), value: rotation)
				
				
				Image(systemName: "arrowtriangle.down.fill")
					.resizable()
					.aspectRatio(1, contentMode: .fit)
					.frame(width:30.0, height: 30.0)
					.offset(x: 0, y: -175)
					.foregroundColor(.red)
				
				Rectangle()
					.frame(width:100, height:40)
					.foregroundColor(.white)
					.overlay() {
						let index: Int = getCurrentIndex(rotation: rotation, userNumber: userNumber)
						Text(lunchMenus[index])
							.opacity(opacity)
					}
			}
		}
	}
	
}
