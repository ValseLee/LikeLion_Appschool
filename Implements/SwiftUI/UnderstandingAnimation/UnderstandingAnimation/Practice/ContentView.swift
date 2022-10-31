//
//  ContentView.swift
//  UnderstandingAnimation
//
//  Created by 이승준 on 2022/10/31.
//	암묵적 애니메이션은 애플 API를 활용하는 것이라 볼 수 있다.

import SwiftUI

struct ContentView: View {
	@State private var rotation = 0.0
	@State private var scale = 1.0
	
    var body: some View {
        VStack {
			Button {
				rotation = (rotation < 360) ? rotation + 60 : 0
				scale = (scale < 2.8) ? scale + 0.3 : 1
			} label: {
				Text("Hello, world!")
					.rotationEffect(.degrees(rotation))
					.scaleEffect(scale)
					.animation(.spring(response: 1, dampingFraction: 0.8, blendDuration: 0.5), value: rotation)
//					.animation(.easeInOut(duration: 1), value: scale)
		}


        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
