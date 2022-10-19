//
//  ContentView.swift
//  firstDrive
//
//  Created by 이승준 on 2022/10/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TitleView()
            MemberNameView()
            BuildView {
                Text("?")
                    .modifier(StandardModifier())
            }
            MemberNameViewBuilder {
                MemberNameView()
            }
        }.onAppear {
            print("화면 나왔당")
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
            .previewDisplayName("12pro로도 볼 수 있다.")
    }
}

struct BuildView<Content: View>: View {
    let content: () -> Content
    
    // 생성자도 후행 클로저일 수 있고, 덕분에 모든 구조체가 클로저 처럼 보이는 것이었다!!
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing:10) {
            content()
        }
        .font(.largeTitle)
    }
}

struct MemberNameViewBuilder<Content: View>: View {
    let content: () -> Content
    
    // 생성자도 후행 클로저일 수 있고, 덕분에 모든 구조체가 클로저처럼 보이는 것이었다!!
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing:10) {
            content()
        }
        .font(.largeTitle)
    }
}

// 얘는 어떻게 동작하는거지
struct StandardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.blue)
            .padding()
    }
    
}
