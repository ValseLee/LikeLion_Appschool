//
//  ContentView.swift
//  PlayWithStacks
//
//  Created by 이승준 on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            GeometryReader { geometry in
                Text("매출!")
                    .font(.title)
                    .frame(width: geometry.size.width)
            }
            Spacer()
            GeometryReader { geometry in
                // GeometryReader는 프레임을 설정하지 않으면 좌상단에서부터 내부 객체를 정렬한다.
                // geometry는 view.frame.height 처럼 작동한다.
                HStack(alignment: .center, spacing: 0) {
                    // 수식어는 순서에 따라 완전히 다른 화면을 보여주기도 한다.
                    Text("1번 텍스트")
                        .frame(width: geometry.size.width / 3, height: geometry.size.height ,alignment: .center)
                    Text("2번 텍스트")
                        .frame(width: geometry.size.width / 3, height: geometry.size.height ,alignment: .center)
                    Text("3번 텍스트")
                        .frame(width: geometry.size.width / 3, height: geometry.size.height ,alignment: .center)

                }
            }
            
            // 그룹은 10개 이상의 뷰를 한 번에 담기 위해 활용할 수 있다.
            // 그런데 사실 10개를 초과하는 뷰를 직접 넣어줄 수 없다는 게 함정
            // 그냥 이름만 있는 정도
            Group {
                Text("?")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
