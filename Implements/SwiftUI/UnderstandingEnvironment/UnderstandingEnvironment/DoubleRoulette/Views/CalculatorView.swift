
//
//  CalculatorView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/26.
//

import SwiftUI

struct CalculatorView: View {
	@ObservedObject var calculatingManager: CalculatingModel
	
	@State private var userInputNumber: String = ""
	@State private var userInputText: String = "0"
	@State private var calculateResult: String = "0"
	@State private var tempOperator: String = ""
	
	@State private var isCalculating: Bool = false
	@State private var userInputArray: [String] = ["", ""]
	
	let calculatorArray: [[Calculator]] = [
		[.clear, .oppsite, .percent, .divide],
		[.seventh, .eighth, .nineth, .multiply],
		[.fourth, .fifth, .sixth, .minus],
		[.first, .second, .third, .plus],
		[.zero1, .zero2, .dot, .equal]
	]
	
	// 계산기 만들기
    var body: some View {
		ZStack {
			Color.black
			
			VStack {
				Spacer()
				
				HStack(alignment: .bottom) {
					Spacer()
					
					if userInputNumber == "", isCalculating == false, calculateResult == "0" {
						Text("0")
							.font(.system(size: 50))
							.foregroundColor(.white)
					} else {
						Text("\(userInputText)")
							.font(.system(size: 50))
							.foregroundColor(.white)
					}
				}.padding([.vertical, .trailing], 15)
				
				ForEach(calculatorArray, id: \.self) { buttons in
					HStack {
						ForEach(buttons, id: \.self) { item in
							Button {
								if userInputNumber == "" {
									switch item.buttonName {
									case "AC":
										userInputNumber = ""
										userInputText = "0"
										userInputArray = ["",""]
									case "+", "-", "*", "/", "=", "%", "+/-":
										print("모르겠음..")
									default:
										userInputNumber = item.buttonName
										userInputText = userInputNumber
									}
								} else { // 유저의 숫자가 입력되는 순간부터 트리거
									switch item.buttonName {
									case "AC":
										userInputNumber = ""
										userInputText = "0"
										userInputArray = ["",""]
									case "+", "-", "*", "/", "%", "+/-":
										isCalculating = true
										startCalculating(calculateNumber: userInputNumber,
											  userOperator: item.buttonName)
										userInputNumber = ""
									case "=":
										isCalculating = false
										startCalculating(calculateNumber: userInputNumber,
											  userOperator: item.buttonName)
										
										calculateResult = userInputArray[0]
										userInputText = calculateResult
										calculatingManager.userCalculateHistory.append(calculateResult)
										userInputNumber = ""
									default:
										if !isCalculating {
											calculateResult = "0"
										}
										userInputNumber += item.buttonName
										userInputText = userInputNumber
									}
								}
							} label: {
								Text("\(item.buttonName)")
									.font(.system(size: 36))
									.foregroundColor(item.buttonFontColor)
									.frame(width: getViewFrame(), height: getViewFrame())
									.background(item.buttonColor)
									.cornerRadius(getViewFrame() / 2)
							}
						}
					}
				}.padding(.bottom, 15)
			}
		}
    }
	
	private func getViewFrame() -> CGFloat {
		return UIScreen.main.bounds.height / 10
	}
	
	private func startCalculating(calculateNumber: String, userOperator: String) {
		switch userInputArray {
		case ["", ""]:
			userInputArray = [calculateNumber, userOperator]
		default:
			switch userInputArray[1] {
			case "+":
				userInputArray[0] = String(Double(userInputArray[0])! + Double(calculateNumber)!)
				userInputArray[1] = userOperator
			case "-":
				userInputArray[0] = String(Double(userInputArray[0])! - Double(calculateNumber)!)
				userInputArray[1] = userOperator
			case "*":
				userInputArray[0] = String(Double(userInputArray[0])! * Double(calculateNumber)!)
				userInputArray[1] = userOperator
			case "/":
				userInputArray[0] = String(Double(userInputArray[0])! / Double(calculateNumber)!)
				userInputArray[1] = userOperator
			case "=":
				userInputArray[0] = calculateNumber
				userInputArray[1] = userOperator
			case "AC":
				userInputArray = ["", ""]
			default:
				print("?")
			}
		}
	}
}

enum Calculator {
	case first, second, third, fourth, fifth, sixth, seventh, eighth, nineth, zero1, zero2
	case plus, minus, multiply, divide, equal, dot
	case percent, oppsite, clear
	
	var buttonName: String {
		switch self {
		case .first:
			return "1"
		case .second:
			return "2"
		case .third:
			return "3"
		case .fourth:
			return "4"
		case .fifth:
			return "5"
		case .sixth:
			return "6"
		case .seventh:
			return "7"
		case .eighth:
			return "8"
		case .nineth:
			return "9"
		case .zero1:
			return "0"
		case .zero2:
			return "00"
		case .plus:
			return "+"
		case .minus:
			return "-"
		case .multiply:
			return "*"
		case .divide:
			return "/"
		case .equal:
			return "="
		case .dot:
			return "."
		case .percent:
			return "%"
		case .oppsite:
			return "+/-"
		case .clear:
			return "AC"
		}
	}
	
	var buttonColor: Color {
		switch self {
		case .percent, .oppsite, .clear:
			return Color.gray
		case .plus, .minus, .multiply, .divide , .equal :
			return Color.orange
		default:
			return Color(UIColor.darkGray)
		}
	}
	
	var buttonFontColor: Color {
		switch self {
		case .percent, .oppsite, .clear:
			return Color.black
		default:
			return Color.white
		}
	}
	
	
}
