//
//  ContentView.swift
//  UnderstandingUIViewMerge
//
//  Created by 이승준 on 2022/11/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          MyScrollView(text: "??")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
