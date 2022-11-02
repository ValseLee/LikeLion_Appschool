//
//  UIWebView.swift
//  UnderstandingUIViewMerge
//
//  Created by 이승준 on 2022/11/02.
//	SafariSevices 를 이용하는 것이 일반적이다.

import SwiftUI
import SafariServices

struct UIWebView: UIViewControllerRepresentable {
	let url: URL
	
	func makeUIViewController(context: UIViewControllerRepresentableContext<UIWebView>) -> SFSafariViewController {
		let web = SFSafariViewController(url: url)
		return web
	}
	
	func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<UIWebView>) {
		//
	}
	
}
