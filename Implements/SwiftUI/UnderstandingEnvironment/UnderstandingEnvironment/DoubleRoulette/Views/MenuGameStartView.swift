//
//  StartView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import SwiftUI

struct MenuGameStartView: View {
	@ObservedObject var MenuData: MenuData
	
	
    var body: some View {
		
		NavigationView {
			VStack {
				Text("10조의 메뉴 추천 룰렛")
					.font(.largeTitle)
					.padding()
				
				NavigationLink(destination: FirstRouletteView()) {
					Text("점심 메뉴 추천")
				}
				
				NavigationLink(destination: SecondRouletteView()) {
					Text("저녁 메뉴 추천")
				}
				
				Text("최근 결과")
				
				NavigationLink(destination: Text("결과")) {
					Text("결과 히스토리")
				}
			}
			.navigationTitle("메뉴 추천 룰렛")
		}
    }
}
