//
//  CalculatingModel.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/26.
//

import Foundation

final class CalculatingModel: ObservableObject {
	@Published var userCalculateHistory: [String] = ["계산 하고 오세요"] {
		didSet {
			print(userCalculateHistory)
		}
	}
}
