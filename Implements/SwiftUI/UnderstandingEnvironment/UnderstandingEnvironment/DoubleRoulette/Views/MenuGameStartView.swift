//
//  StartView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import SwiftUI

struct MenuGameStartView: View {
	@ObservedObject var menuData: MenuInformationModel
	@ObservedObject var calculatingManager = CalculatingModel()
	
    var body: some View {
		TabView {
			VStack {
				StartTextView(menuData: menuData)
			}.tabItem {
				Image(systemName: "house")
				Text("시작화면")
			}
			
			NavigationView {
				RouletteView(menuData: menuData,
							 rouletteTitle: "돌려 돌려 \n점메추 돌림판 ~ !",
							 rouletteStartButtonText: "점심 뭐먹지?👅",
							 isLunch: true)
			}.tabItem {
				Image(systemName: "sun.max.fill")
					.renderingMode(.original)
				Text("점심 메뉴 골라줘")
			}
			
			NavigationView {
				RouletteView(menuData: menuData,
							 rouletteTitle: "돌려 돌려 \n저메추 돌림판 ~ !",
							 rouletteStartButtonText: "저녁 뭐먹지?👅",
							 isLunch: false)
			}.tabItem {
				Image(systemName: "moon.fill")
					.renderingMode(.original)
				Text("저녁 메뉴 골라줘")
			}
			
			
			NavigationView {
				CalculatorView(calculatingManager: calculatingManager)
				// 계산기 열거형으로 구현
				// 모델 == 열거형
				// 1. 계산기 모델 파일생성
				// 2. 계산기 화면 파일생성
			}.tabItem {
				Image(systemName: "number")
				Text("식사비 계산기")
			}
			
			NavigationView {
				ResultHistoryView(menuData: menuData, calculatingManager: calculatingManager)
			}.tabItem {
				Image(systemName: "clock")
					.renderingMode(.original)
				Text("결과 히스토리 보기")
			}
			
			//					NavigationLink(destination: RouletteView(menuData: menuData,
			//															 rouletteTitle: "돌려 돌려 \n점메추 돌림판 ~ !",
			//															 rouletteStartButtonText: "점심 뭐먹지?👅",
			//															 isLunch: true)) {
			//						Text("점심 메뉴 추천받으러 가기")
			//							.modifier(TextButtonModifer())
			//					}
			//
			//					NavigationLink(destination: RouletteView(menuData: menuData,
			//															 rouletteTitle: "돌려 돌려 \n저메추 돌림판 ~ !",
			//															 rouletteStartButtonText: "저녁 뭐먹지?👅",
			//															 isLunch: false)) {
			//						Text("저녁 메뉴 추천받으러 가기")
			//							.modifier(TextButtonModifer())
			//					}
			//					NavigationLink(destination: ResultHIstoryView(menuData: menuData)) {
			//						Text("결과 히스토리 보기")
			//							.modifier(TextButtonModifer())
			//					}
			//					.padding()
			//					.navigationTitle("메뉴 추천 룰렛")
		}
    }
}

struct TextButtonModifer: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.title2)
			.frame(width: 175, height: 75)
			.background(Color.blue.opacity(0.7))
			.foregroundColor(.white)
			.cornerRadius(25)
	}
}

struct StartTextView: View {
	@ObservedObject var menuData: MenuInformationModel
	
	var body: some View {
		Group {
			Text("10조의 메뉴 추천 룰렛")
				.font(.largeTitle)
				.padding()
			
			Text("오늘 점심, 저녁 뭐 먹을지 고민이라면?")
				.font(.title3)
				.padding(.bottom, 25)
			
			Text("최근 결과 -> " + "\n\(menuData.menuResultList.last!)")
				.modifier(ResultTextModifier())
		}
	}
}
