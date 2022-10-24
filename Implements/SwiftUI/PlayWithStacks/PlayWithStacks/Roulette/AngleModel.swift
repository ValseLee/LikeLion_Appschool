//
//  AngleModel.swift
//  PlayWithStacks
//
//  Created by 이승준 on 2022/10/22.
//

import Foundation

struct AngleModel {
    
    public func getEachAngle(isStart: Bool, userNumber: Int, index: Int) -> Double {
        if isStart, userNumber != 7 {
            let arcStartPosition = Double(360 / userNumber * index)
            return arcStartPosition
        } else if !isStart, userNumber != 7 {
            let arcEndPosition = Double(360 / userNumber * (index - 1))
            return arcEndPosition
        } else if isStart, (userNumber == 7) {
            let arcStartPosition = Double(360 / userNumber * index)
            let startAngleRest = Double(360 % userNumber)
            return arcStartPosition + startAngleRest
        } else if !isStart, (userNumber == 7) {
            let arcEndPosition = Double(360 / userNumber * (index - 1))
            let endAngleRest = Double(360 % (userNumber - 1))
            return arcEndPosition + endAngleRest
        }
        return 0.0
    }
    
    // 애니메이션을 돌려서 움직인 각도만큼을 더함
    // 움직인 각도를 360로 나눠지지 않을 때까지 나눈 뒤, 나머지를 구함
    // 그 나머지 각도의 끝에 화살표가 갖는 각도 270도 인 메뉴를 보여주면 된다.
    public func getRouletteMenu(angles: [Double], movesFor: Double, index: Int) {
        
    }
}
