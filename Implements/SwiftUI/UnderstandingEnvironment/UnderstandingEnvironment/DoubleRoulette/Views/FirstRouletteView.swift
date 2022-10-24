//
//  FirstRouletteView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import SwiftUI

struct FirstRouletteView: View {
	
	
    var body: some View {
		VStack() {
			Spacer()
			
			Text("돌려 돌려\n점메추 돌림판 ~ ! ")
				.font(.largeTitle)
				.fontWeight(.black)
				.foregroundColor(.pink)
				.multilineTextAlignment(.leading)
				.opacity(titleTextOpacity)
				.padding()
				.onAppear(perform: {
					//앱이 실행되고 제목이 서서히 보이게 만드는 역할
					withAnimation(.easeInOut(duration: 1.0)){
						titleTextOpacity = 1.0
					}
				})
			
			
			FirstRouletteBoard(userNumber: $userNumber, rotation: $rotation, opacity: $resultTextOpacity)
			
			Stepper(value: $userNumber, in: 2...10, step: 1) {
				Text("메뉴 \(userNumber)개 선택")
			}
			.frame(width: 240.0)
			.padding()
			
			
			Button(action:{
				//버튼을 누를때 마다 결과텍스트 투명도를 0.0으로 초기화해준다.
				resultTextOpacity = 0.0
				
				//돌림판 회전값 랜덤 추가
				rotation += Int.random(in: 1...3600)
				
				//지금으로부터 9초 후에 투명도를 1.0으로 만들어주는 역할
				DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 9) {
					resultTextOpacity = 1.0
				}
			}){
				Text("점심 뭐먹지?👅")
					.frame(width:150.0, height:30.0)
			}
			.buttonStyle(.borderedProminent)
			.offset(x:0, y:-150)
			.accentColor(.pink)
			Spacer()
		}
	}
}


