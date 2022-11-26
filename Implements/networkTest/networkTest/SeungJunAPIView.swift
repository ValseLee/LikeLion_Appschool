//
//  ContentView.swift
//  networkTest
//
//  Created by 이승준 on 2022/11/22.
//

import SwiftUI

struct SeungJunAPIView: View {
	@ObservedObject var ghibliManager: GhibliObject

	var body: some View {
		VStack {
			if ghibliManager.isFetching {
				ProgressView()
			} else {
				List {
					ForEach(ghibliManager.ghibliArrays, id: \.id) { eachInfo in
						Text("\(eachInfo.title)")
					}
				}
			}
		}
		.task {
			do {
				ghibliManager.isFetching = true
				ghibliManager.ghibliArrays = try await ghibliManager.getGhibliDataArray()
				ghibliManager.isFetching = false
				print(#function)
			} catch {
				print(error)
			}
		}
	}
}
