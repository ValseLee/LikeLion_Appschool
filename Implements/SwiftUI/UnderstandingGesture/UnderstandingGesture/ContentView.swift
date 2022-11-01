//
//  ContentView.swift
//  UnderstandingGesture
//
//  Created by 이승준 on 2022/11/01.
//

import SwiftUI

struct ContentView: View {
	@State private var moveValue = 0
	@State private var isMoving = false
	
	@State private var isTimerRunning = false
	@State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	@GestureState private var dragEnabled = false
	
    var body: some View {
		
		return VStack {
			ZStack {

				Circle()
					.fill(.clear)
					.overlay {
						Circle().stroke(Color.black, lineWidth: 10)
					}
					.frame(width: 250, height: 250)
				
				Image(systemName: "star.fill")
					.resizable()
					.foregroundColor(.blue)
					.offset(y: -125)
					.frame(width: 25, height: 25)
					.onReceive(timer) { _ in
						if self.isTimerRunning {
							moveValue += 10
						}
					}
					.rotationEffect(.degrees(Double(moveValue)))
					.animation(.easeInOut, value: moveValue)
					.animation(.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 0), value: moveValue)
			}
			
			
			Button(action: {
			}) {
				VStack {
					Text("Move it")
						.gesture(TapGesture().onEnded({ _ in
							moveValue += 100
							isMoving = true
						}))
						.gesture(LongPressGesture(minimumDuration: 1.5)
								.onEnded({ isLongTappedEnd in
									isTimerRunning.toggle()
									self.startTimer()
								}))
						
				}
			}.padding(.vertical, 15)
			
			if isTimerRunning {
				Button("Reset") {
					moveValue = 0
					isMoving = false
					self.stopTimer()
					isTimerRunning = false
				}
			}
			
			if isMoving {
				Text("To Left or Right")
					.gesture(LongPressGesture(minimumDuration: 1.0).updating($dragEnabled, body: { value, state, trans in
						state = value
						print("??")
					}).sequenced(before: DragGesture().onChanged({ value in
						moveValue = Int(value.location.x)
					})))
			}
		}
		.onAppear {
			self.stopTimer()
		}
    }
	
	private func startTimer() {
		self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	}
	
	private func stopTimer() {
		self.timer.upstream.connect().cancel()
	}
}
