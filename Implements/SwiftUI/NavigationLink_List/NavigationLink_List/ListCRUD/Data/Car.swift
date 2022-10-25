//
//  Car.swift
//  NavigationLink_List
//
//  Created by 이승준 on 2022/10/25.
//

import SwiftUI

struct Car: Codable, Identifiable {
	var id: String
	var name: String
	var description: String
	var isHybrid: Bool
	var imageName: String
	
	public var carData: [Car] = CarData().loadJson("carData.json")
}
