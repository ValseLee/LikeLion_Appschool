//
//  SharingAPI.swift
//  SwiftUI4NewFeatures
//
//  Created by 이승준 on 2022/11/16.
//

import SwiftUI

struct SharingAPI: View {
	private var photoManager = SharingPhoto(image: Image(systemName: "star"),
											caption: "star")
	// AirDrop과 관련된 기능들! 파일의 드래그 앤 드롭, 공유 시트까지
    var body: some View {
		VStack {
			ShareLink(item: URL(string: "https://developer.apple.com/")!) {
				Text("ShareLink")
			}
			
			ShareLink(item: photoManager,
					  preview: SharePreview.init("Image Share",
												 image: Image(systemName: "heart")))
		}
    }
}

struct SharingAPI_Previews: PreviewProvider {
    static var previews: some View {
        SharingAPI()
    }
}

struct SharingPhoto: Transferable {
	static var transferRepresentation: some TransferRepresentation {
		ProxyRepresentation(exporting: \.image)
	}
	
	public var image: Image
	public var caption: String
}
