//
//  TimerObject.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/24.
//

import Foundation
import Combine

final class TimerObject: ObservableObject {
    @Published var timeCounter = 0
    @Published var name = "안녕"
	
    var timer: Timer?
    
	init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timerDidFire),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func timerDidFire() {
        timeCounter += 1
    }
    
    public func resetCount() {
        timeCounter = 0
    }
    
    public func updateName() {
        self.name = "안녕하세요"
    }
}
