//
//  SecondView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import SwiftUI

struct SecondTimerView: View {
    @EnvironmentObject var timer: TimerObject
    
    var body: some View {
        VStack {
            Text("Second Timer")
                .font(.largeTitle)
            
            Text("Timer Count = \(timer.timeCounter)")
                .font(.headline)
            
            Button(action: updateName) {
                Text("이름 바꾸기")
            }
        }.padding()
    }

    func updateName() {
        timer.updateName()
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondTimerView().environmentObject(TimerObject())
//    }
//}
