//
//  JooHeeNetwork.swift
//  networkTest
//
//  Created by 이승준 on 2022/11/23.
//

import Foundation

struct DeaguRestaurant: Codable {
	var status: String
	var total: String
	var data: [DeaguRestaurantData]
}

struct DeaguRestaurantData: Codable {
	var cnt: String
	var OPENDATA_ID: String
	var GNG_CS: String
	var FD_CS: String
	var BZ_NM: String
	var TLNO: String
	var MBZ_HR: String
	var SEAT_CNT: String
	var PKPL: String
	var HP: String
	var PSB_FRN: String
	var BKN_YN: String
	var INFN_FCL: String
	var BRFT_YN: String
	var DSSRT_YN: String
	var MNU: String
	var SMPL_DESC: String
	var SBW: String
	var BUS: String
}

final class DeaguNetwork: ObservableObject {
	func getDeaguRestaurant() async throws -> Void {
		let url = URL(string: "https://www.daegufood.go.kr/kor/api/tasty.html?mode=json&addr=%EC%A4%91%EA%B5%AC")!
		let session = URLSession(configuration: .default)
		
		let task = try await session.data(from: url)
		let result = try JSONDecoder().decode(DeaguRestaurant.self, from: task.0)
		print(result)
	}
}
