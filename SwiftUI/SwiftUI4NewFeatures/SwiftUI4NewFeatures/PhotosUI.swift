//
//  PhotosUI.swift
//  SwiftUI4NewFeatures
//
//  Created by 이승준 on 2022/11/16.
//

import SwiftUI
import PhotosUI

struct PhotosUI: View {
	@State private var selectedItem: PhotosPickerItem?
	@State private var selectedImageData: Data?
	
	// Improved By UIKit -> PhotosUI
	var body: some View {
		VStack {
			if let selectedImageData,
			   let image = UIImage(data: selectedImageData) {
				Image(uiImage: image)
					.resizable()
					.frame(width: 200, height: 200)
			}
			
			PhotosPicker("picker", selection: $selectedItem, matching: .images)
				.onChange(of: selectedItem) { newImage in
					Task {
						if let data = try? await
							// loadTransferable은 에러 함수에 async다.
							newImage?.loadTransferable(type: Data.self) {
							selectedImageData = data
						}
					}
				}
		}
	}
}

struct PhotosUI_Previews: PreviewProvider {
    static var previews: some View {
        PhotosUI()
    }
}
