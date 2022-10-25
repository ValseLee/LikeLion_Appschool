//
//  SwiftStore.swift
//  NavigationLink_List
//
//  Created by 이승준 on 2022/10/25.
//

import SwiftUI
import Combine

final class CarStore: ObservableObject {
	@Published var cars: [Car]
	
	init(cars: [Car] = []) {
		self.cars = cars
	}
}
