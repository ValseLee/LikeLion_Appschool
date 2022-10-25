//
//  CarData.swift
//  NavigationLink_List
//
//  Created by 이승준 on 2022/10/25.
//

import SwiftUI
import UIKit

final class CarData {	
	public func loadJson<T: Decodable>(_ fileName: String) -> T {
		let data: Data
		
		guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
			fatalError("\(fileName) not Found")
		}
		
		do {
			data = try Data(contentsOf: file)
		} catch {
			fatalError("Could not Load \(fileName) : \(error)")
		}
		
		do {
			return try JSONDecoder().decode(T.self, from: data)
		} catch {
			fatalError("Unable to parse \(fileName) : \(error)")
		}
	}
}
