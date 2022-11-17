//
//  ChartView.swift
//  SwiftUI4NewFeatures
//
//  Created by 이승준 on 2022/11/17.
//

import SwiftUI
import Charts

struct ChartView: View {
	// 맞춤화 차트. 막대 차트, 스트림 그래프, VoiceOver도 지원
	
    var body: some View {
		Chart {
			// 왜 x축을 써야 하나요 -> VoiceOver와 다국어 대응을 위해.
			BarMark(x: .value("Shape Type", data[0].type),
					y: .value("Total Count", data[0].count))
		}
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

struct ToyShape: Identifiable {
	var id = UUID()
	var count: Double
	var type: String
}

var data: [ToyShape] = [
	.init(count: 5, type: "Cube"),
	.init(count: 4, type: "Sphere"),
	.init(count: 4, type: "Pyramid")
]
