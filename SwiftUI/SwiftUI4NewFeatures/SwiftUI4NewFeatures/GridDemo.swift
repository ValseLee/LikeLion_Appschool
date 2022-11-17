//
//  GridDemo.swift
//  SwiftUI4NewFeatures
//
//  Created by 이승준 on 2022/11/15.
//

import SwiftUI

struct GridDemo: View {
	@State private var koreaScore = 6
	@State private var uruguayScore = 3
	
	var body: some View {
		VStack {
			// 어디서 많이 본 MS의 로고
			Grid {
				GridRow {
					Text("Office")
						.background(.red)
					Text("Xbox")
						.background(.green)
				}
				
				GridRow {
					Text("Windows")
						.background(.blue)
					
					Text("Bing")
						.background(.yellow)
				}
			}
			Divider()
			
			Grid {
				// 가상의 칸이 있기 때문에 훨씬 깔끔하고 편리하게 정렬이 가능할 것
				GridRow {
					Text("Korea")
					
					ForEach(0..<koreaScore, id: \.self) { _ in
						Circle().fill(.red)
							.frame(width: 20, height: 20)
					}
				}
				
				GridRow {
					Text("Uruguay")
					
					ForEach(0..<uruguayScore, id: \.self) { _ in
						Circle().fill(.red)
							.frame(width: 20, height: 20)
					}
				}
			}
			.font(.largeTitle)
		}
		
		
	}
}

	struct GridDemo_Previews: PreviewProvider {
		static var previews: some View {
			GridDemo()
		}
	}
