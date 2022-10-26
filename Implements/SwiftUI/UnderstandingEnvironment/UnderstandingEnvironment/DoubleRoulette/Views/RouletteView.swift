//
//  FirstRouletteView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import SwiftUI

struct RouletteView: View {
	@ObservedObject var menuData: MenuInformationModel
	
	let rouletteTitle: String
	let rouletteStartButtonText: String
	let isLunch: Bool
	
	var body: some View {
		VStack() {
			Spacer()
			
			RouletteBoard(menuData: menuData, isLunch: isLunch, rouletteTitle: rouletteTitle)
			
			Stepper(value: $menuData.userNumber, in: 2...10, step: 1) {
				Text("메뉴 \(menuData.userNumber)개 선택")
			}
			.frame(width: 240.0)
			.padding()
			
			Button(action: {
				menuData.resultTextOpacity = 0.0
				menuData.rotation += Int.random(in: 361...3600)
				menuData.toggleIsPlayed()
				DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 9) {
					menuData.resultTextOpacity = 1.0
				}
			}) {
				Text("\(self.rouletteStartButtonText)")
					.frame(width: 150.0, height: 30.0)
			}
			.buttonStyle(.borderedProminent)
			.offset(x: 0, y: -125)
			.accentColor(.pink)
			Spacer()
		}
	}
}


