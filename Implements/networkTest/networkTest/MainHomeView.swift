//
//  MainHomeView.swift
//  networkTest
//
//  Created by 이승준 on 2022/11/23.
//

import SwiftUI

struct MainHomeView: View {
	private var disneyNetworkManager = DisneyNetwork()
	private var harryPotterNetworkManager = HarryPotterNetwork()
	private var deaguNetworkManager = DeaguNetwork()
	private var emojiDataNetwork = EmojiDataNetwork()
	
	@State private var nameArray = [
		"김혜지 님",
		"박시현 님",
		"이승준 님",
		"정소희 님",
		"홍주희 님"
	]
	
	@State private var dataNameArray = [
		"혜지님 api",
		"경기도_정류장 주변도로 미세먼지빅데이터 기반 대응시스템 공공데이터 조회",
		"지브리 영화정보",
		"해리포터 캐릭터 정보",
		"대구광역시_맛집"
	]
	
	var body: some View {
		NavigationStack {
			List {
				ForEach(0..<nameArray.count, id: \.self) { index in
					NavigationLink(destination: {
						switch nameArray[index] {
						case "김혜지 님":
							Text("\(nameArray[index])")
						case "박시현 님":
							Text("\(nameArray[index])")
						case "이승준 님":
							SeungJunAPIView(ghibliManager: GhibliObject())
						case "정소희 님":
							Text("\(nameArray[index])")
						case "홍주희 님":
							Text("\(nameArray[index])")
						default:
							Text("??")
						}
					}, label: {
						VStack(alignment: .center) {
							Text("\(nameArray[index])")
								.font(.title3)
							Text("\(dataNameArray[index])")
								.font(.callout)
						}
					})
				}
			}
		}
		.task {
			do {
				try await disneyNetworkManager.getDisneyData()
				try await harryPotterNetworkManager.getHarryPotterInfo()
				try await deaguNetworkManager.getDeaguRestaurant()
				try await emojiDataNetwork.getEmojiDataAsync()
//				emojiDataNetwork.getEmojiData()
			} catch {
				print(error)
			}
			
		}
	}
	
}

struct MainHomeView_Previews: PreviewProvider {
	static var previews: some View {
		MainHomeView()
	}
}
