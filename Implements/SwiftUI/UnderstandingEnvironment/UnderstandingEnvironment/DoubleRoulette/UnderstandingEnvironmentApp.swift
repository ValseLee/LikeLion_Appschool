//
//  UnderstandingEnvironmentApp.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import SwiftUI

@main
struct UnderstandingEnvironmentApp: App {
    
    // 뷰를 초기화하기 전, ObservableObject 초기화
    let timer = TimerObject()
	
	let menuData = MenuData()
    
    var body: some Scene {
        WindowGroup {
            // 초기화된 ObservableObject의 인스턴스를 생성자로 전달
//            StartView()
//				.environmentObject(timer)
			MenuGameStartView(menuData: menuData)
        }
    }
}
