//
//  UnderstandingState.swift
//  PlayWithStacks
//
//  Created by 이승준 on 2022/10/21.
//

import SwiftUI

struct UnderstandingState: View {
    let colorArray: [Color] = [
        .red, .yellow, .gray, .blue, .pink, .purple, .brown, .indigo, .green, .orange, .teal
    ]
    
    let lunchMenuArray = [
        "부대찌개",
        "제육볶음",
        "돈까스",
        "마카롱",
        "불백",
        "김치찜",
        "파스타",
        "피자",
        "양꼬치",
        "냉면"
    ]
    
    let radius: CGFloat = 150.0
    
    @Binding private var userNumber: Int
    
    // 2 ~ 10
    var body: some View {
        let menuNumber = userNumber + 2
        
        VStack {
            GeometryReader { geo in
                let centerWidth: CGFloat = geo.size.width / 2
                let centerHeight: CGFloat = geo.size.height / 2 - 20.0
                
                ZStack {
                    let _ = print("1")
                    
                    RouletteView(centerWidth: centerWidth, centerHeight: centerHeight,
                                 radius: radius, colorArray: colorArray, menuArray: lunchMenuArray,
                                 userNumber: menuNumber)
                    .onAppear {
                        print(TimeZone.current)
                    }
                    
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                        .position(x: centerWidth, y: centerHeight)
                }
            }
        }
    }
    
    init(userNumber: Binding<Int>) {
        self._userNumber = userNumber
    }
}

extension UnderstandingState: Equatable {
    static func == (lhs: UnderstandingState, rhs: UnderstandingState) -> Bool {
        return lhs.userNumber.self == rhs.userNumber.self
    }
}
