//
//  GraphView.swift
//  GraphicDrawingPractice
//
//  Created by 이승준 on 2022/10/27.
//

import SwiftUI

struct GraphView: View {
	let randomNumArray = [
		Int.random(in: 0...100),
		Int.random(in: 0...100),
		Int.random(in: 0...100),
		Int.random(in: 0...100),
		Int.random(in: 0...100),
		Int.random(in: 0...100),
		Int.random(in: 0...100),
		Int.random(in: 0...100),
		Int.random(in: 0...100)
	]
	
    var body: some View {

		VStack {
			GeometryReader { geo in
				let centerWidth = geo.size.width / 2
				
				VStack {
					Path { path in
						var offsetX = Int(centerWidth / CGFloat(randomNumArray.count))
						path.move(to: CGPoint(x: offsetX, y: randomNumArray[0]))
						
						for number in randomNumArray {
							offsetX += Int(centerWidth / CGFloat(randomNumArray.count))
							path.addLine(to: CGPoint(x: offsetX, y: number))
						}
					}.stroke(Color.black, lineWidth: 2.0)
						.rotationEffect(.degrees(180), anchor: .center)
						.rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
						.frame(maxWidth: .infinity)
					
					HStack {
						ForEach(randomNumArray, id: \.self) { number in
							Text("\(number)")
								.frame(width: centerWidth / CGFloat(randomNumArray.count))
						}
					}
				}
			}
			
			
			
			HStack {
				StickGraph(array: randomNumArray)
					.frame(height: 400)
			}.padding()
		}
		
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}

struct StickGraph: View {
	let array: [Int]
	
	var body: some View {
		ForEach(array, id: \.self) { element in
			VStack {
				Spacer()
				Rectangle()
					.frame(height: CGFloat(element * 2))
				Text("\(element)")
			}
		}
	}
}


