//
//  ResultHIstoryView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import SwiftUI

struct ResultHIstoryView: View {
	@ObservedObject var menuData: MenuData
	
    var body: some View {
		let resultList = menuData.menuResultList
		
		VStack {
			Text("최근 5회 추첨 결과")
				.font(.largeTitle)
			Spacer()
			
			ForEach(1 ..< resultList.count, id: \.self) { index in
				switch index {
				case resultList.count - 5 ... resultList.count:
					Text("\(resultList[index])")
						.modifier(ResultTextModifier())
						.padding()
				default:
					EmptyView()
				}
			}
			Spacer()
		}
		
    }
}

struct ResultTextModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(width: 250, height: 75)
			.font(.title3)
			.background(Color.black)
			.foregroundColor(.white)
			.cornerRadius(25)
	}
}
