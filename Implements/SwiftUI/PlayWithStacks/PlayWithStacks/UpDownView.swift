//
//  UpDownView.swift
//  PlayWithStacks
//
//  Created by 이승준 on 2022/10/20.
//

import SwiftUI

struct UpDownView: View {
    let array = [
        "정답입니다!",
        "랜덤 숫자는 더 작아요",
        "랜덤 숫자가 더 커요",
        "에러: 입력 값이 잘못되었습니다.",
        ""
    ]
    
    let answerImageUrl = "https://media.discordapp.net/attachments/1019072261854081044/1032522053317820477/unknown.png"
    
    @State private var count = 0
    @State private var arrayIndex = 4
    @State private var randomNumber = 0
    @State private var userNumber = ""
    @State private var isCorrect = false
    
    var body: some View {
        VStack {
            Spacer()
            Text(array[arrayIndex])
                .padding()
            Text("시도 횟수 : \(count)")
            Text("내가 고른 숫자는? \n \(userNumber)")
                .padding()
            
            if randomNumber == 0 && arrayIndex != 0 {
                Button("Get Random Number") {
                    randomNumber = Int.random(in: 1...1)
                    print(randomNumber)
                }.buttonStyle(.bordered)
                TextField("랜덤 숫자를 먼저 생성해주세요", text: $userNumber)
                    .multilineTextAlignment(.center)
                    .disabled(true)
                Button("랜덤 숫자를 누른 후에 채점해주세요") {
                    print()
                }.buttonStyle(.bordered)
                    .disabled(true)
            } else if randomNumber != 0 && arrayIndex != 0 {
                Button("다시 시작하기") {
                    count = 0
                    self.userNumber = ""
                    randomNumber = 0
                    arrayIndex = 4
                    isCorrect = false
                }.buttonStyle(.bordered)
                TextField("1부터 100 사이의 숫자를 입력해주세요", text: $userNumber)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .disabled(false)
                
                Button("확인해볼까요") {
                    guard let userNumber = Int(userNumber) else {
                        arrayIndex = 3
                        return
                    }
                    
                    switch userNumber {
                    case randomNumber:
                        arrayIndex = 0
                        count += 1
                    case 1..<randomNumber:
                        arrayIndex = 1
                        count += 1
                        print("작아유")
                    case (randomNumber + 1)...100:
                        arrayIndex = 2
                        count += 1
                        print("큼")
                    case ...0, 100...:
                        arrayIndex = 3
                        print("범위밖")
                    default:
                        print("?")
                    }
                }.buttonStyle(.bordered)
            } else if arrayIndex == 0 {
                Button("다시 시작하기") {
                    count = 0
                    self.userNumber = ""
                    randomNumber = 0
                    arrayIndex = 4
                    isCorrect = false
                }.buttonStyle(.bordered)
                Spacer()
                GeometryReader { geo in
                    ZStack {
                        AsyncImage(url: URL(string: answerImageUrl), transaction: .init(animation: .easeInOut(duration: 1.5))) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(1.0, contentMode: .fill)
                                    .blur(radius: 75.0)
                            default:
                                ProgressView()
                            }
                        }
                        .frame(width: geo.size.width, height: geo.size.height)
                        
                        AsyncImage(url: URL(string: answerImageUrl), transaction: .init(animation: .easeInOut(duration: 1.5))) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(1.0, contentMode: .fill)
                            default:
                                ProgressView()
                            }
                        }
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 1.5)
                    }
                    .onAppear {
                        isCorrect = true
                    }
                }
            }
            Spacer()
        }.background(Color.red.opacity(0.1))
    }
}

struct UpDownView_Previews: PreviewProvider {
    static var previews: some View {
        UpDownView()
    }
}
