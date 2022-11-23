//
//  SoHeeNetwork.swift
//  networkTest
//
//  Created by 이승준 on 2022/11/23.
//

import Foundation

struct HarryPotter: Codable {
	var name: String?
	var alternate_names: [String]?
	var species: String?
	var gender: String?
	var house: String?
	var dateOfBirth: String?
	var yearOfBirth: Int?
	var wizard: Bool?
	var ancestry: String?
	var eyeColour: String?
	var hairColour: String?
	var wand: WandInfo?
	var patronus: String?
	var hogwartsStudent: Bool?
	var hogwartsStaff: Bool?
	var actor: String?
	var alternate_actors: [String]?
	var alive: Bool?
	var image: String?
}

struct WandInfo: Codable {
	var wood: String?
	var core: String?
	var length: Double?
}

final class HarryPotterNetwork: ObservableObject {
	
	func getHarryPotterInfo() async throws -> Void {
		let url = URL(string: "https://hp-api.herokuapp.com/api/characters")!
		let session = URLSession(configuration: .default)
		
		let data = try await session.data(from: url)
		let result = try JSONDecoder().decode([HarryPotter].self, from: data.0)
		print(result)
	}
}
