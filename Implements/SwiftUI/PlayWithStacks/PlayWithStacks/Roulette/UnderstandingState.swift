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
    
    @State private var isBtnPressed: Bool = false
    @Binding private var userNumber: Int
    
    // 2 ~ 10
    var body: some View {
        let menuNumber = userNumber + 2
        VStack {
            GeometryReader { geo in
                let centerWidth: CGFloat = geo.size.width / 2
                let centerHeight: CGFloat = geo.size.height / 2 - 20.0
                
                if menuNumber == 0 {
                    MenuSelectStartView()
                        .position(x: centerWidth, y: centerHeight)
                } else {
                    ZStack {
                        RouletteView(centerWidth: centerWidth, centerHeight: centerHeight,
                                     radius: radius, colorArray: colorArray, menuArray: lunchMenuArray,
                                     userNumber: menuNumber)
                        .overlay {
                            ZStack {
                                Color.white
                                    .clipShape(Circle())
                                Circle()
                                    .stroke(Color.black, lineWidth: 1.0)
                            }.frame(width: CGFloat(radius / 6),
                                    height: CGFloat(radius / 6),
                                    alignment: .center)
                            .position(x: centerWidth ,y: centerHeight)
                        }
                    }
                }
            }
            
            Button {
                isBtnPressed.toggle()
            } label: {
                isBtnPressed
                ? Text("멈출래요")
                : Text("돌릴래요")
            }.padding(15)
            Spacer()
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
