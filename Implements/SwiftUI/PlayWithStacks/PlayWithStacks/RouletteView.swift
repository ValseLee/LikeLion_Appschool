//
//  RouletteView.swift
//  PlayWithStacks
//
//  Created by 이승준 on 2022/10/21.
//

import SwiftUI

struct RouletteView: View, Hashable {
    let centerWidth: CGFloat
    let centerHeight: CGFloat
//    let eachArcStartAngle: Double
//    let eachArcEndAngle: Double
    let radius: CGFloat
    let colorArray: [Color]
    let userNumber: Int
    let menuArray: [String]
    
    var body: some View {
        ForEach(1 ..< userNumber + 1) { index in
            let eachArcStartAngle: Double = Double(360 / userNumber * index) + Double(360 % userNumber)
            let eachArcEndAngle: Double = Double(360 / userNumber * (index - 1)) + Double(360 % (userNumber - 1))
            let middleAngle: Double = (eachArcStartAngle + eachArcEndAngle) / 2

            Path { path in
                path.move(to: CGPoint(x: centerWidth, y: centerHeight))
                path.addArc(center: .init(x: centerWidth, y: centerHeight),
                            radius: radius,
                            startAngle: Angle(degrees: eachArcStartAngle),
                            endAngle: Angle(degrees: eachArcEndAngle),
                            clockwise: true)
            }
            .fill(colorArray.shuffled()[index - 1])
            .overlay {
                Image(systemName: "triangle.fill")
                    .rotationEffect(Angle(degrees: 180))
                    .position(x: centerWidth, y: centerHeight - 150)
                Text("\(menuArray.shuffled()[index - 1])")
                    .rotationEffect(Angle(degrees: 15.0))
                    .offset(x: radius / 1.25 * cos(middleAngle * Double.pi / 180) - 5,
                            y: radius / 1.25 * sin(middleAngle * Double.pi / 180) - 15)
            }
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
//        eachArcStartAngle: Double, eachArcEndAngle: Double,
//        self.eachArcStartAngle = eachArcStartAngle
//        self.eachArcEndAngle = eachArcEndAngle
    }
}

