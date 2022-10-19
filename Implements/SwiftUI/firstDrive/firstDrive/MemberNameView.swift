//
//  MemberNameView.swift
//  firstDrive
//
//  Created by 이승준 on 2022/10/18.
//

import SwiftUI

struct MemberNameView: View {
    let name = ["승준", "원형", "성민", "예원", "진형", "석준", "형구", "혜성"]
    let colorArray: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple, .pink]
    
    var body: some View {
        VStack {
            ForEach(0 ..< name.count) { index in
                Text(name[index])
                    .foregroundColor(colorArray[index])
            }
        }
    }
}

