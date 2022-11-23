//
//  HyejiNetwork.swift
//  networkTest
//
//  Created by 이승준 on 2022/11/23.
//

import Foundation

struct EmojiData: Codable {
	var name: String
	var category: String
	var group: String
	var htmlCode: [String]
	var unicode: [String]
}

final class EmojiDataNetwork: ObservableObject {
	let url = URL(string: "https://emojihub.herokuapp.com/api/all")!
	
	// async await 없이
	func getEmojiData() {
		let task = URLSession.shared.dataTask(with: url) { data, res, error in
			guard let data else { return }
			
			do {
				let result = try JSONDecoder().decode([EmojiData].self, from: data)
				print(result)
			} catch {
				print(error)
			}
		}
		task.resume()
	}
	
	// 동시성 키워드로 가져오기
	func getEmojiDataAsync() async throws -> Void {
		let task = try await URLSession.shared.data(from: url)
		let result = try JSONDecoder().decode([EmojiData].self, from: task.0)
		print(result)
	}
}
