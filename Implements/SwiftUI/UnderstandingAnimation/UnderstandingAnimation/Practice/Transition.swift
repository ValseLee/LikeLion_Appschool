//
//  Transition.swift
//  UnderstandingAnimation
//
//  Created by 이승준 on 2022/10/31.
//

import SwiftUI

struct Transition: View {
	@State private var isButtonVisible: Bool = true
	
    var body: some View {
		VStack {
			// 바인딩된 불리언이 바뀌면 애니메이션을 조건에 따른 뷰에 적용한다.
			Toggle(isOn: $isButtonVisible.animation(.linear(duration: 1))) {
				Text("Show/Hide")
			}.padding(.horizontal, 25)
			
			if isButtonVisible {
				Button {
					print()
				} label: {
					Text("Example")
						.font(.largeTitle)
				}.transition(.opacity.combined(with: .move(edge: .top)))
			} else {
				EmptyView()
					.transition(.opacity.combined(with: .move(edge: .top)))
			}
		}
    }
}

struct Transition_Previews: PreviewProvider {
    static var previews: some View {
        Transition()
    }
}
