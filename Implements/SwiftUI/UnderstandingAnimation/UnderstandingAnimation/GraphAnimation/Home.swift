//
//  Home.swift
//  UnderstandingAnimation
//
//  Created by 이승준 on 2022/10/31.
//

import SwiftUI

struct Home: View {
	@State private var isLoaded: Bool = false
	@State private var firstNumberArrays: [Int] = []
	@State private var secondNumberArrays: [Int] = []
	@State private var thirdNumberArrays: [Int] = []
	
	@State private var isViewChanging: Bool = false
	
	typealias ArrayElements = [Int]
	@State private var numberArrays: [ArrayElements] = [[]]
	
	@State private var index = 0
	
    var body: some View {
		NavigationView {
			VStack {
				if numberArrays.count != 1, isViewChanging {
					switch index {
					case 1:
						EachChartView(numberArray: $numberArrays[index])
							.transition(.opacity.animation(.easeInOut(duration: 1.0)))
							.navigationTitle("Three Array Chart View")
					case 2:
						EachChartView(numberArray: $numberArrays[index])
							.transition(.opacity.animation(.easeInOut(duration: 1.0)))
							.navigationTitle("Three Array Chart View")
					case 3:
						EachChartView(numberArray: $numberArrays[index])
							.transition(.opacity.animation(.easeInOut(duration: 1.0)))
							.navigationTitle("Three Array Chart View")
					default:
						EmptyView()
					}
				} else {
					Text("Select Your Chart")
						.navigationTitle("Three Array Chart View")
				}
				
				Divider()
				
				VStack {
					VStack {
						if !isViewChanging {
							ForEach(0..<3, id:\.self) { index in
								Button("\(index + 1)번 차트 보기") {
									withAnimation {
										self.isViewChanging.toggle()
									}
									self.index = index + 1
								}.padding(.vertical, 5)
							}
						} else {
							Button("돌아가기") {
								withAnimation {
									self.isViewChanging.toggle()
								}
							}.padding(.vertical, 5)
						}
					}
					Spacer()
				}
				
			}.onAppear {
				if isLoaded == false {
					makeArrays()
				}
				isLoaded = true
			}
		}
    }
	
	private func makeArrays() {
		for _ in 0...10 {
			firstNumberArrays.append(Int.random(in: 0...100))
			secondNumberArrays.append(Int.random(in: 0...100))
			thirdNumberArrays.append(Int.random(in: 0...100))
		}
		numberArrays.append(firstNumberArrays)
		numberArrays.append(secondNumberArrays)
		numberArrays.append(thirdNumberArrays)
	}
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
