//
//  ContentView.swift
//  TabBarPractice
//
//  Created by 이승준 on 2022/10/26.
//	탭은 기술적인 고민보다 기획과 UX를 더 신경써야 하는 기능이다.
// 	앱 자체의 depth가 길어지는 건 좋지 않거든.
//	그래서 탭뷰에는 최대 5개의 아이템만 넣는 것이 좋다.
//  SwiftUI 는 뷰의 배치에 따라 업무 효율도가 크게 달라질 수 있다.

import SwiftUI

struct ContentView: View {
	
	// selection으로 바인딩되면, tag의 값으로 일치하는 뷰로 변환할 수 있다.
	// 그 값은 해셔블하기만 하면 된다.
	@State private var tabSelected = 1
	
	@State private var foregroundDefaultColor = Color.white
	@State private var backgroundDefaultColor = Color.black
	
    var body: some View {
		NavigationView {
			TabView(selection: $tabSelected) {
				SecondView()
					.tabItem {
						// 세로 화면에서는 VStack 뷰, 가로로 눕히면 HStack 뷰로 자동으로 레이아웃 변경된다.
						Image(systemName: "sun.max.fill")
						Text("1이야")
					}.tag(1)
				ContextMenuView(foregroundDefaultColor: $backgroundDefaultColor,
								backgroundDefaultColor: $foregroundDefaultColor)
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContextMenuView: View {
	@Binding var foregroundDefaultColor: Color
	@Binding var backgroundDefaultColor: Color
	
	var body: some View {
		Text("2")
			.foregroundColor(foregroundDefaultColor)
			.background(backgroundDefaultColor)
			.contextMenu {
				Button {
					self.foregroundDefaultColor = .yellow
					self.backgroundDefaultColor = .purple
				} label: {
					Text("??")
				}
			}
			.tabItem {
				Image(systemName: "sun.max.fill")
				Text("2야")
			}.tag(2)
	}
}

struct SecondView: View {
	var body: some View {
		List {
			NavigationLink(destination: ThirdView(), label: {
				Text("@@")
			})
		}
		
	}
}

struct ThirdView: View {
	var body: some View {
		Text("!")
	}
}
