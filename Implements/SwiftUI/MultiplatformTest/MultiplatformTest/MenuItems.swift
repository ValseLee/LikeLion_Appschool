//
//  MenuItems.swift
//  MultiplatformTest
//
//  Created by 이승준 on 2022/11/30.
//

import Foundation

struct SchoolItems: Identifiable {
	var id = UUID().uuidString
	var name: String
	var description: String
}

let schoolList = [
	SchoolItems(name: "Schools", description: "")
]

struct MenuItems: Identifiable {
	var id = UUID().uuidString
	var name: String
	var description: String
}

let menuItems = [
	MenuItems(name: "Startup", description: "학교야"),
	MenuItems(name: "App", description: "학교야"),
	MenuItems(name: "BE", description: "학교야"),
	MenuItems(name: "FE", description: "학교야"),
	MenuItems(name: "Blockchain", description: "학교야"),
	MenuItems(name: "AI", description: "학교야")
]
