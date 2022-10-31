//
//  ChartView.swift
//  UnderstandingAnimation
//
//  Created by 이승준 on 2022/10/31.
//

import SwiftUI

struct EachChartView: View {
	@Binding var numberArray: [Int]
	
	@State private var animationNums: Int = 0
	
    var body: some View {
		HStack {
			ForEach(numberArray, id: \.hashValue) { num in
				VStack {
					Spacer()
					Rectangle()
						.frame(height: CGFloat(num * 2))
						.overlay {
							Text("\(num)")
								.font(.body)
								.fontWeight(.medium)
								.foregroundColor(num <= 10 ? .orange : .white)
						}
				}
				.animation(.linear, value: animationNums)
			}
		}
		.padding(.horizontal, 10)
		.onAppear {
			withAnimation {
				animationNums += 1
			}
		}
    }
}

struct EachChartView_Previews: PreviewProvider {
	@State var array = [1,2,3,4,5,7]
	
    static var previews: some View {
		EachChartView(numberArray: .constant([10,25,31,4,5,66,7,81,95,1]))
    }
}
