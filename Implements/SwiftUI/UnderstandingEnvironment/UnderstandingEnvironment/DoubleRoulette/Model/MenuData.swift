//
//  RouletteData.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import Foundation
import Combine

final class MenuData: ObservableObject {
	@Published var userNumber: Int = 10
	@Published var rotation: Int = 0
	@Published var titleTextOpacity: CGFloat = 0.0
	@Published var resultTextOpacity: CGFloat = 0.0
	
	public var isPlayed: Bool = false
	
	public let menuDictionary: [String: [String]] = [
		"Lunch" :
			["부대찌개", "돈까스", "불백", "김치찜", "마카롱", "육개장", "짜장면", "초밥", "스파게티", "삼겹살"],
		"Dinner" :
			["해물탕", "라멘", "탕수육", "파스타", "피자", "김피탕", "돼지국밥", "선지국", "감자탕", "초콜렛"]
	]
	
	public var menuResultList: [String] = ["아직 메뉴를 고르지 않았군요!"]
	
	public func resetData() {
		userNumber = 10
		rotation = 0
		titleTextOpacity = 0.0
		resultTextOpacity = 0.0
		isPlayed = false
	}
	
	public func menuResultListUpdate(menuName: String, mealTime: String) {
		let result = "\(menuResultList.count)회차 " + "\(mealTime) 메뉴 : " + menuName
		self.menuResultList.append(result)
		print(menuResultList)
	}
	
	public func getCurrentIndex(rotation: Int, userNumber: Int) -> Int {
		var offsetRotation: Int = 270 - rotation % 360
		var index: Int = 0
		
		if offsetRotation < 0 {
			offsetRotation = 360 + offsetRotation
		}
		
		while offsetRotation > 0 {
			index += 1
			offsetRotation -= Int(360 / userNumber)
		}
		
		return (index - 1)
	}
	
	public func toggleIsPlayed() {
		isPlayed = true
	}
}

