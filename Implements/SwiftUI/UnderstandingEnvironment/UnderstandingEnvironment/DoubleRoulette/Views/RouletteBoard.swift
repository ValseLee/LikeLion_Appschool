//
//  FirstRouletteBoard.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import SwiftUI

struct RouletteBoard: View {
	@ObservedObject var menuData: MenuInformationModel
	
	let dictionaryKey: String
	var color: [Color] = [
		.red, .yellow, .gray, .blue, .pink, .purple, .brown, .indigo, .green, .orange, .teal
	]
	
	var body: some View {
		GeometryReader { geo in
			let centerWidth: CGFloat = geo.size.width / 2
			let centerHeight: CGFloat = geo.size.height / 2
			
			ZStack {
				Circle()
					.frame(width: 320, height: 320)
				
				ForEach(1 ..< menuData.userNumber + 1) { index in
					let eachArcStartAngle: Double = Double(360 / menuData.userNumber * (index - 1))
					let eachArcEndAngle: Double = Double(360 / menuData.userNumber * (index))
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
						let textWidthPosition: Double = 100 * cos(middleAngle * Double.pi / 180)
						let textHeightPosition: Double = 100 * sin(middleAngle * Double.pi / 180)
						Text(menuData.menuDictionary[dictionaryKey]![index - 1])
							.offset(x: textWidthPosition,
									y: textHeightPosition)
					}
				}
				.rotationEffect(.degrees(Double(self.menuData.rotation)))
				.animation(.timingCurve(0, 0.8, 0.2, 1, duration: 10), value: menuData.rotation)
				
				Image(systemName: "arrowtriangle.down.fill")
					.resizable()
					.aspectRatio(1, contentMode: .fit)
					.frame(width: 30.0, height: 30.0)
					.offset(x: 0, y: -175)
					.foregroundColor(.red)
				
				Rectangle()
					.frame(width: 100, height: 40)
					.foregroundColor(.white)
					.overlay {
						let index = menuData.getCurrentIndex(rotation: menuData.rotation,
															 userNumber: menuData.userNumber)
						let menuResult = menuData.menuDictionary[dictionaryKey]![index]
						Text(menuResult)
							.opacity(menuData.resultTextOpacity)
							.onDisappear {
								if menuData.isPlayed {
									menuData.menuResultListUpdate(menuName: menuResult,
																  mealTime: dictionaryKey)
								}
								menuData.resetData()
							}
					}
			}
		}
	}
	
	init(menuData: MenuInformationModel, isLunch: Bool) {
		self.dictionaryKey = isLunch ? "Lunch" : "Dinner"
		self.menuData = menuData
	}
}
