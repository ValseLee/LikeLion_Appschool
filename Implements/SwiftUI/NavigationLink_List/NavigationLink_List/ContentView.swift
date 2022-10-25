//
//  ContentView.swift
//  NavigationLink_List
//
//  Created by 이승준 on 2022/10/25.
//

import SwiftUI

struct ToDoItem: Identifiable {
	var id = UUID()
	var task: String
	var imageName: String
}

var listData: [ToDoItem] = [
	ToDoItem(task: "Wash the car", imageName: "car.fill"),
	ToDoItem(task: "Vacuum house", imageName: "house.fill"),
	ToDoItem(task: "Pick up kids from school bus @ 3pm", imageName: "bus.doubledecker"),
	ToDoItem(task: "Auction the kids on ebay", imageName: "cart.fill"),
	ToDoItem(task: "Order Pizza for dinner", imageName: "sun.max.fill")
]

struct ContentView: View {
	@State private var toggleStatus = true
	
	var body: some View {
		List {
			Section(header: Text("Settings")) {
				Toggle(isOn: $toggleStatus) {
					Text("Allow Notification")
				}
			}
			
			Section(header: Text("To Do Tasks")) {
				ForEach(listData) { item in
					HStack {
						Image(systemName: item.imageName)
							.renderingMode(.original)
						Text(item.task)
					}
				}
			}
		}
		.listStyle(.plain)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
