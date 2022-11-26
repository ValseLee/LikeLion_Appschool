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
						VStack {
							HStack {
								AsyncImage(url: URL(string: eachInfo.image)!) { phase in
									switch phase {
									case .empty:
										ProgressView()
											.padding()
									case .success(let img):
										img
											.resizable()
											.aspectRatio(1, contentMode: .fit)
									case .failure:
										Image(systemName: "star")
									default:
										EmptyView()
									}
								}
								
									
								VStack(alignment: .leading) {
									Text("영화 제목 : " + "\(eachInfo.title)")
										.font(.title2)
									Text("영화 줄거리 : " + "\(eachInfo.description)")
										.font(.body)
										.lineLimit(4)
								}
							}
						}
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
