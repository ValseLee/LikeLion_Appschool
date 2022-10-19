//
//  StateExampleView.swift
//  PlayWithStacks
//
//  Created by 이승준 on 2022/10/19.
//

import SwiftUI

struct StateExampleView: View {
    @State private var name = ""
    @State private var isWifiEnabled: Bool = true
    
    var body: some View {
        VStack(alignment: .center) {
            // 바인딩 타입을 인자로 받아오도록 정의된 자리가 있다.
            TextField("Hi", text: $name)
                .multilineTextAlignment(.center)
                .border(.black)
            Text(name)
            
            HStack(spacing: 20) {
                Toggle(isOn: $isWifiEnabled) {
                    Text("와이파이 되니?")
                    WifiResultView(isWifiEnabled: $isWifiEnabled)
                }.padding()
                Text(isWifiEnabled ? "되네요" : "헉 안되네요")
                    .padding()
            }.padding()
        }
    }
}

struct StateExampleView_Previews: PreviewProvider {
    static var previews: some View {
        StateExampleView()
    }
}

struct WifiResultView: View {
    @Binding var isWifiEnabled: Bool
    
    var body: some View {
        Image(systemName: isWifiEnabled ? "wifi" : "wifi.slash")
            .modifier(WifiResultViewModifier(isWifiEnabled: $isWifiEnabled))
    }
}

struct WifiResultViewModifier: ViewModifier {
    @Binding var isWifiEnabled: Bool
    
    func body(content: Content) -> some View {
        if isWifiEnabled {
            content.foregroundColor(.blue)
        } else {
            content.foregroundColor(.red)
        }
    }
}

func getImageColor(isWifiEnabled: Bool) -> Color {
    if isWifiEnabled {
        return Color.blue
    } else {
        return Color.red
    }
}
