//
//  ExplicitAnimationView.swift
//  UnderstandingAnimation
//
//  Created by 이승준 on 2022/10/31.
//	명시적 애니메이션은 수정자 대신 클로저 내에서 특정 부분에서만 애니메이션이 진행되도록 한다.
//	대표적으로는 withAnimation()

import SwiftUI

struct ExplicitAnimationView: View {
	@State private var rotation = 0.0
	@State private var scale = 1.0
	
	@State private var position = CGPoint(x: Double.random(in: 50.0...300.0),
										  y: Double.random(in: 50.0...300.0))
	
	var body: some View {
		Button {
			
		} label: {
			Image(systemName: "star.fill")
				.rotationEffect(.degrees(rotation))
				.position(position)
		}.onAppear {
			withAnimation(.easeInOut(duration: 0.3)) {
				rotation = rotation + 60
				position = CGPoint(x: Double.random(in: 50.0...300.0), y: Double.random(in: 50.0...300.0))
			}
		}
	}
}

struct ExplicitAnimationView_Preview: PreviewProvider {
	static var previews: some View {
		ExplicitAnimationView()
	}
}
