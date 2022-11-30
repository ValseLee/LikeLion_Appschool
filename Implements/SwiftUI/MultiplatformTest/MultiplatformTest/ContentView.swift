//
//  ContentView.swift
//  MultiplatformTest
//
//  Created by 이승준 on 2022/11/30.
//	iPad 앱은 OS가 따로 있는 게 아니기 때문에 Multiplatform으로 개발한다.
//	MacOS는 AppKit 프레임워크(유킷보다 오래됨)로 앱을 만들어 왔다.

//	멀티플랫폼 프로젝트는 프로젝트 설정에서 명시되어 있듯 iPad, Mac 까지 지원한다.

import SwiftUI

struct ContentView: View {
	@State private var selectedMenuItemID: MenuItems.ID?
	@State private var selectedSchoolItemID: SchoolItems.ID?
	
    var body: some View {
		if #available(macOS 13.0, *) {
			NavigationSplitView {
				List(schoolList, selection: $selectedSchoolItemID) { items in
					Text(items.name)
				}
			} content: {
				List(menuItems, selection: $selectedMenuItemID) { menus in
					Text(menus.name)
				}
			} detail: {
				SchoolDetailsView(menuID: selectedMenuItemID)
			}
		} else {
			// Fallback on earlier versions
			Text("Early Versions")
		}
    }
}

struct SchoolDetailsView: View {
	let menuID: MenuItems.ID?
	
	// 1번 예시
	var selectedSchool: MenuItems? {
		get {
			for temp in menuItems {
				if temp.id == menuID {
					return temp
				}
			}
			return nil
		}
	}
	
	// 2번 예시 : 어차피 id 같은 건 하나일 테니까?
	var selected: MenuItems? {
		return menuItems.filter { $0.id == menuID }.first
	}
	
	var body: some View {
		// 3번 예시
		List(menuItems) { menus in
			if menus.id == menuID {
				Text(menus.name + "상세내용")
					.navigationTitle(menus.name ?? "")
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
