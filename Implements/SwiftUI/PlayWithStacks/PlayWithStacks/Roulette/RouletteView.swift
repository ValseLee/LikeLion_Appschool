//
//  RouletteView.swift
//  PlayWithStacks
//
//  Created by 이승준 on 2022/10/21.
//

import SwiftUI

struct RouletteView: View {
    let centerWidth: CGFloat
    let centerHeight: CGFloat
    let radius: CGFloat
    let colorArray: [Color]
    let userNumber: Int
    let menuArray: [String]
    let angleManager = AngleModel()
    
    var body: some View {
        let userNumberArray: [Int] = Array(1 ..< userNumber + 1)
        
        ForEach(userNumberArray, id: \.self) { index in
            let eachArcStartAngle = angleManager.getEachAngle(isStart: true,
                                                              userNumber: userNumber, index: index)
            let eachArcEndAngle = angleManager.getEachAngle(isStart: false,
                                                            userNumber: userNumber, index: index)
            
            let middleAngle: Double = (eachArcStartAngle + eachArcEndAngle) / 2

            let roulettePath = Path { path in
                path.move(to: CGPoint(x: centerWidth, y: centerHeight))
                path.addArc(center: .init(x: centerWidth, y: centerHeight),
                            radius: radius,
                            startAngle: Angle(degrees: eachArcStartAngle),
                            endAngle: Angle(degrees: eachArcEndAngle),
                            clockwise: true)
                path.closeSubpath()
                print(#function, eachArcStartAngle, eachArcEndAngle, 270.0, menuArray[index - 1])
            }
            roulettePath
                .fill(colorArray[index - 1])
                .overlay {
                roulettePath.stroke(Color.black, lineWidth: 1)
                    
                Image(systemName: "triangle.fill")
                    .rotationEffect(Angle(degrees: 180))
                    .position(x: centerWidth, y: centerHeight - 150)

                Text("\(menuArray[index - 1])")
                    .rotationEffect(Angle(degrees: 10.0))
                    .offset(x: radius / 1.25 * cos(middleAngle * Double.pi / 180) - 5,
                            y: radius / 1.25 * sin(middleAngle * Double.pi / 180) - 15)
            }
            let menuIndex = angleManager.getEachRouletteItem(angles: [eachArcStartAngle, eachArcEndAngle], movesFor: 0.0, index: index)
            
            Text("\(menuArray[menuIndex])")
                .font(.title)
                .position(x: centerWidth, y: centerHeight - (radius * 1.3))
        }
    }
    
    init(centerWidth: CGFloat, centerHeight: CGFloat,
         radius: CGFloat, colorArray: [Color], menuArray: [String],
         userNumber: Int) {
        self.centerWidth = centerWidth
        self.centerHeight = centerHeight
        self.radius = radius
        self.colorArray = colorArray
        self.userNumber = userNumber
        self.menuArray = menuArray
    }
}
