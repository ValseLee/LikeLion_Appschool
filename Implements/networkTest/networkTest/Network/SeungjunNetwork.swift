//
//  Network.swift
//  networkTest
//
//  Created by 이승준 on 2022/11/22.
//

import Foundation

struct Ghibli: Codable, Identifiable, Hashable {
	var id: String
	var title: String
	var original_title: String
	var original_title_romanised: String
	var image: String
	var movie_banner: String
	var description: String
	var director: String
	var producer: String
	var release_date: String
	var running_time: String
	var rt_score: String
	var people: [String]
	var species: [String]
	var location: [String]?
	var vehicles: [String]
	var url: String
}

struct PeopleData: Codable {
	var id: String?
	var name: String?
	var gender: String?
	var age: String?
	var eye_color: String?
	var hair_color: String?
	var films: [String]?
	var species: String?
	var url: String?
}

final class GhibliObject: ObservableObject {
	@Published var ghibliArrays: [Ghibli] = []
	@Published var ghibliPeopleInfo: PeopleData?
	@Published var isFetching: Bool = true
	
	let decoder = JSONDecoder()
	let session = URLSession(configuration: .default)
	
	public func getGhibliDataArray() async throws -> [Ghibli] {
		let url = URL(string: "https://ghibliapi.herokuapp.com/films")!
		
		let ghibliData = try await session.data(from: url)
		let fetchedData = try JSONDecoder().decode([Ghibli].self, from: ghibliData.0)
		
		return fetchedData
	}
}

