//
//  SheetDemo.swift
//  SwiftUI4NewFeatures
//
//  Created by 이승준 on 2022/11/15.
//

import SwiftUI

struct SheetDemo: View {
	@State private var showingSheet = false
	
    var body: some View {
		VStack {
			Button("Show") {
				showingSheet.toggle()
			}
		}
		.sheet(isPresented: $showingSheet) {
			Text("Sheet Yeah")
			// Drag로 어떻게 Sheet 크기를 조절하는가?
				.presentationDetents([.height(250),
									  .fraction(0.35),
									  .large])
		}
    }
}

struct SheetDemo_Previews: PreviewProvider {
    static var previews: some View {
        SheetDemo()
    }
}
