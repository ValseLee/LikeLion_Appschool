//
//  FirstRouletteView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import SwiftUI

struct FirstRouletteView: View {
	@ObservedObject var menuData: MenuData
	
	var body: some View {
		VStack() {
			Spacer()
			
			Text("돌려 돌려\n점메추 돌림판 ~ ! ")
				.font(.largeTitle)
				.fontWeight(.black)
				.foregroundColor(.pink)
				.multilineTextAlignment(.leading)
				.opacity(menuData.titleTextOpacity)
				.padding()
				.onAppear(perform: {
					withAnimation(.easeInOut(duration: 1.0)) {
						menuData.titleTextOpacity = 1.0
					}
				})
			
			FirstRouletteBoard(menuData: menuData)
			
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
				Text("점심 뭐먹지?👅")
					.frame(width: 150.0, height: 30.0)
			}
			.buttonStyle(.borderedProminent)
			.offset(x: 0, y: -125)
			.accentColor(.pink)
			Spacer()
		}
	}
}


