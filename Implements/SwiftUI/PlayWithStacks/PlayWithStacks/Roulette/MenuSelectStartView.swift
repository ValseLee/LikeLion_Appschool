//
//  MenuSelectStartView.swift
//  PlayWithStacks
//
//  Created by 이승준 on 2022/10/22.
//

import SwiftUI

struct MenuSelectStartView: View {
    @State private var menuNumber = 0
    @State private var navPath = NavigationPath()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("점심 메뉴를 골라보아요")
                    .font(.largeTitle)
                
                Picker("몇 개의 메뉴?", selection: $menuNumber) {
                    ForEach(2..<11) { index in
                        Text("\(index)개")
                    }
                }
                
                Text("후보 메뉴 \(menuNumber + 2)개로 \n메뉴판을 생성할까요?")
                    .font(.body)
                    .multilineTextAlignment(.center)
                
                NavigationLink {
                    UnderstandingState(userNumber: $menuNumber)
                } label: {
                    Text("그럽시다")
                }

            }
        }
    }
}

struct MenuSelectStartView_Previews: PreviewProvider {
    static var previews: some View {
        MenuSelectStartView()
    }
}

