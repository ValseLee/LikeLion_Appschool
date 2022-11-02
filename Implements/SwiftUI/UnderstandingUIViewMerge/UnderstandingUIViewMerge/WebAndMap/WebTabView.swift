//
//  WebTabView.swift
//  UnderstandingUIViewMerge
//
//  Created by 이승준 on 2022/11/02.
//

import SwiftUI

struct WebTabView: View {
	@State private var isWebTabVisible: Bool = false
	
    var body: some View {
		VStack {
			Button {
				isWebTabVisible = true
			} label: {
				Text("Open Web")
			}
		}
		.sheet(isPresented: $isWebTabVisible) {
			WebModalView(isWebTabVisible: $isWebTabVisible)
		}
    }
}

struct WebModalView: View {
	@Binding var isWebTabVisible: Bool
	
	var body: some View {
		UIWebView(url: URL(string: "https://naver.com")!)
	}
}

struct WebTabView_Previews: PreviewProvider {
    static var previews: some View {
        WebTabView()
    }
}
