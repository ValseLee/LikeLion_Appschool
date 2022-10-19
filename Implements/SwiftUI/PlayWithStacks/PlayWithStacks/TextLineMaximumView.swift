//
//  TextLineMaximumView.swift
//  PlayWithStacks
//
//  Created by 이승준 on 2022/10/19.
//

import SwiftUI

let str = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
"""

struct TextLineMaximumView: View {
    var body: some View {
        HStack {
            Text("유저의 아이디")
                .lineLimit(3)
                .layoutPriority(0)
            Text("유저가 원하는 정보")
                .layoutPriority(1)
        }
    }
}

struct TextLineMaximumView_Previews: PreviewProvider {
    static var previews: some View {
        TextLineMaximumView()
    }
}
