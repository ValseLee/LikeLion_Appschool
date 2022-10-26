//
//  MenuSelectHistoryView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/26.
//

import SwiftUI

struct MenuSelectHistoryView: View {
	@ObservedObject var menuData: MenuInformationModel
	
    var body: some View {
		List {
			if menuData.menuResultList.count == 1 {
				Section(content: {
					EmptyView()
				}, header: {
					Text("\(menuData.menuResultList[0])")
						.modifier(ResultTextModifier())
						.padding(25)
				})
			} else {
				ForEach(1 ..< menuData.menuResultList.count, id: \.self) { index in
					HStack {
						Spacer()
						VStack(alignment: .center) {
							menuData.menuImageList[index]
								.resizable()
								.aspectRatio(1, contentMode: .fit)
								.frame(width: 300, height: 300)
								.padding(.top, 15)
							Spacer()
							Text("\(menuData.menuResultList[index])")
						}
						Spacer()
					}
				}.onDelete(perform: { index in
					menuData.menuResultList.remove(atOffsets: index)
				})
				.navigationTitle("결과 히스토리")
			}
		}.listStyle(GroupedListStyle())
    }
}
