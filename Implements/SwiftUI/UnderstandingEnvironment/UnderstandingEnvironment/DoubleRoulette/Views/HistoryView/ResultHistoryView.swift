//
//  ResultHIstoryView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import SwiftUI

struct ResultHistoryView: View {
	@ObservedObject var menuData: MenuInformationModel
	@ObservedObject var calculatingManager: CalculatingModel
	
	var body: some View {
		
		NavigationView {
			VStack {
				NavigationLink(destination: {
					MenuSelectHistoryView(menuData: menuData)
				}) {
					Text("메뉴 히스토리보기")
				}
				
				NavigationLink(destination: CalculateHistoryView(calculatingManager: calculatingManager), label: {
					Text("계산기 히스토리보기")
				})
			}
		}
		
//
		Spacer()
	}
}

struct ResultTextModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(minWidth: 275, minHeight: 75)
			.font(.title3)
			.background(Color.black)
			.foregroundColor(.white)
			.cornerRadius(25)
	}
}
