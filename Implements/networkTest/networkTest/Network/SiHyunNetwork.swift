//
//  SiHyunNetwork.swift
//  networkTest
//
//  Created by 이승준 on 2022/11/23.
//

import Foundation

struct DisneyData: Codable {
	var count: Int
	var totalPages: Int
	var nextPage: String
	var data: [DisneyDataInfo]
		
}

struct DisneyDataInfo: Codable {
	var films: [String?]
	var shortFilms: [String?]
	var tvShows: [String?]
	var videoGames: [String?]
	var parkAttractions: [String?]
	var allies: [String?]
	var enemies: [String?]
	var _id: Int
	var name: String
	var imageUrl: String
	var url: String
}

final class DisneyNetwork: ObservableObject {
	func getDisneyData() async throws -> Void {
		let url = URL(string: "https://api.disneyapi.dev/characters")!
		
		let data = try await URLSession.shared.data(from: url)
		let result = try JSONDecoder().decode(DisneyData.self, from: data.0)
	
	}
}
