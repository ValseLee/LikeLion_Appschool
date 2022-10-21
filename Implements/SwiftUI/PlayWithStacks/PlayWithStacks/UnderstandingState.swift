//
//  UnderstandingState.swift
//  PlayWithStacks
//
//  Created by 이승준 on 2022/10/21.
//

import SwiftUI

struct UnderstandingState: View {
    let color: [Color] = [
        .red, .yellow, .gray, .blue, .pink, .purple, .brown, .indigo, .green, .orange, .teal
    ]
    
    let lunchMenuArray = [
        "부대찌개",
        "제육볶음",
        "돈까스",
        "마카롱",
        "불백",
        "실비김치찜",
        
    ]
    
    @State private var userNumber: Int = 10
    @State private var isBtnPressed: Bool = false
        
    // 2 ~ 10
    var body: some View {
        VStack {
            GeometryReader { geo in
                let centerWidth: CGFloat = geo.size.width / 2
                let centerHeight: CGFloat = geo.size.height / 2 - 20.0
                
                ForEach(1 ..< userNumber + 1) { index in
                    let eachArcStartAngle = Double(360 / userNumber * index) + Double(360 % userNumber)
                    let eachArcEndAngle = Double(360 / userNumber * (index - 1)) + Double(360 % (userNumber - 1))
                    let middleAngle: Double = (eachArcStartAngle + eachArcEndAngle) / 2
                    
                    Path { path in
                        path.move(to: CGPoint(x: centerWidth, y: centerHeight))
                        path.addArc(center: .init(x: centerWidth, y: centerHeight),
                                    radius: 150,
                                    startAngle: Angle(degrees: eachArcStartAngle),
                                    endAngle: Angle(degrees: eachArcEndAngle),
                                    clockwise: true)
                    }
                    .fill(color[index - 1])
                    .overlay {
                        Text("Text")
                        .offset(x: 150 * cos(middleAngle * Double.pi / 180),
                             y: 150 * sin(middleAngle * Double.pi / 180) - 15)
                    }
                }
            }.animation(Animation.easeInOut(duration: .infinity), value: isBtnPressed)
            Button("돌리자") {
                isBtnPressed.toggle()
                print("그래")
            }.padding()
        }
    }
}
