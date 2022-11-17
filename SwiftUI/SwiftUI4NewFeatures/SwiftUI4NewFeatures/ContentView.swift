//
//  ContentView.swift
//  SwiftUI4NewFeatures
//
//  Created by 이승준 on 2022/11/15.
//

import SwiftUI

struct ContentView: View {
	// 이 상태 값은 배열 리터럴을 가질 수 있다.
	@State private var previousViewNumbers = NavigationPath()
	
	var body: some View {
		// path를 설정하면 리스트에서 어떤 곳을 먼저 보여줄지 설정할 수 있다.
		NavigationStack(path: $previousViewNumbers) {
			// 여기서는 value 타입이 스트링이어서 Int 타입을 받는 Destination은 작동하지 않는다.
			NavigationLink(value: "Bob") {
				Text("CEO")
			}
			
			List(1..<30) { index in
				// 리터럴 값을 받고 그 값을 전달할 것이라 선언
				NavigationLink(value: index) {
					Label("No. \(index)", systemImage: "\(index).square")
				}
			}
			// 전달받는 값의 타입을 받고 클로저에서 꺼내서 Destination 정의
			.navigationDestination(for: Int.self) { index in
				Text("\(index)")
			}
			.navigationDestination(for: String.self, destination: { name in
				Text("CEO is \(name)")
			})
			.navigationTitle("Inc.")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
