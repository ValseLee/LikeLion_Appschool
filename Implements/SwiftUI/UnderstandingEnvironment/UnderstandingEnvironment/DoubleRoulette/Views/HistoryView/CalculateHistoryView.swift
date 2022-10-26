//
//  CalculateHistoryView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/26.
//

import SwiftUI

struct CalculateHistoryView: View {
	@ObservedObject var calculatingManager: CalculatingModel
	
    var body: some View {
		List {
			ForEach(calculatingManager.userCalculateHistory, id: \.self) { element in
				Text("\(element)")
			}
		}
    }
	
}

