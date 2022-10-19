//
//  ButtonView.swift
//  PlayWithStacks
//
//  Created by 이승준 on 2022/10/19.
//

import SwiftUI

struct ButtonView: View {
    
    var body: some View {
        
        VStack {
            Button(action: buttonPressed) {
                Image(systemName: "sun.min.fill")
            }
            
            Button {
                print("?")
            } label: {
                Image(systemName: "sun.max.fill")
            }

            Button("Click Me") {
                print("?")
            }
        }
    }
    
    func buttonPressed() -> Void {
        print("버튼이 눌렸다.")
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
