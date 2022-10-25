//
//  CarView.swift
//  NavigationLink_List
//
//  Created by 이승준 on 2022/10/25.
//

import SwiftUI

struct CarView: View {
	var body: some View {
		
		NavigationView {
			VStack {
				Text("?")
			}
			.navigationTitle(Text("EV Cars"))
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					
					NavigationLink(destination: Text("?"), label: {
						Text("Add")
					})
				}
				
				ToolbarItem(placement: .navigationBarTrailing) {
					EditButton()
				}
			}
		}
	}
	
	func moveItems(from source: IndexSet, to destination: Int) {
		print(source, destination)
	}
}

struct CarView_Previews: PreviewProvider {
    static var previews: some View {
        CarView()
    }
}
