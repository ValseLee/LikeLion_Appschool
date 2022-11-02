//
//  ImagePickerView.swift
//  UnderstandingUIViewMerge
//
//  Created by 이승준 on 2022/11/02.
//

import SwiftUI

struct ImagePickerView: View {
	@State var imagePickerVisible: Bool = false
	@State var selectedImage: Image? = Image(systemName: "photo")
	
    var body: some View {
		ZStack {
			VStack {
				selectedImage?
					.resizable()
					.aspectRatio(1, contentMode: .fit)
				
				Button {
					withAnimation {
						self.imagePickerVisible.toggle()
					}
				} label: {
					Text("select Image")
				}
			}.padding(10)
			
			if imagePickerVisible {
				UIImagePicker(imagePickerVisible: $imagePickerVisible, selectedImage: $selectedImage)
			}
		}
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
