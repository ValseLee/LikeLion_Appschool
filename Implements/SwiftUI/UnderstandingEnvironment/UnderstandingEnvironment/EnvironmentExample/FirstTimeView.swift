//
//  ContentView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import SwiftUI
import Combine

struct FirstTimeView: View {
    
    // 생성자로 초기화된 ObservableObject를 ObsevedObject 변수로 할당
    // 환경객체로 바꾸기 위해 프로퍼티래퍼 이름만 변경
    @EnvironmentObject var timer: TimerObject
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Timer Count = \(timer.timeCounter)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("누구의 이름 : \(timer.name)")
                
                Button(action: resetCount) {
                    Text("Reset")
                }
                
                NavigationLink {
					SecondTimerView()
                } label: {
                    Text("To Next Screen")
                }
                .padding()
            }
        }
    }
    
    private func resetCount() {
        timer.resetCount()
    }
}


/*--------------------------------------------------------*/
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView()
//    }
//}
