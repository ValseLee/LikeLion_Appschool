//
//  RouletteData.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import Foundation
import Combine

final class RouletteData: ObservableObject {
	@Published var menuResultList: [String] = [""]
	
	@Published var userNumber: Int = 10
	@Published var rotation: Int = 0
	@Published var titleTextOpacity: CGFloat = 0.0
	@Published var resultTextOpacity: CGFloat = 0.0
	
	func resetData() {
		userNumber = 10
		rotation = 0
		titleTextOpacity = 0.0
		resultTextOpacity = 0.0
	}
	
	func menuResultListUpdate(menuName: String) {
		self.menuResultList.append(menuName)
	}
}

