//
//  UIImagePicker.swift
//  UnderstandingUIViewMerge
//
//  Created by 이승준 on 2022/11/02.
//

import SwiftUI

struct UIImagePicker: UIViewControllerRepresentable {
	
	
	@Binding var imagePickerVisible: Bool
	@Binding var selectedImage: Image?
	
	func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
		
	}
	
	func makeUIViewController(context: Context) -> some UIImagePickerController {
		let picker = UIImagePickerController()
		return picker
	}
	
	func makeCoordinator() -> Coordinator {
		return Coordinator(imagePickerVisible: $imagePickerVisible, selectedImage: $selectedImage)
	}
	
	class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
		@Binding var imagePickerVisible: Bool
		@Binding var selectedImage: Image?
		
		init(imagePickerVisible: Binding<Bool>, selectedImage: Binding<Image?>) {
			_imagePickerVisible = imagePickerVisible
			_selectedImage = selectedImage
		}
		
		func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
			imagePickerVisible = false
		}
		
		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			let image: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
			selectedImage = Image(uiImage: image)
			imagePickerVisible = false
		}
	}
}

struct Preview: PreviewProvider {
	static var previews: some View {
		UIImagePicker(imagePickerVisible: .constant(true), selectedImage: .constant(Image(systemName: "photo")))
	}
}
