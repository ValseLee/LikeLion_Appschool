
//
//  CalculatorView.swift
//  UnderstandingEnvironment
//
//  Created by 이승준 on 2022/10/26.
//

import SwiftUI

struct CalculatorView: View {
	@ObservedObject var calculatingManager: CalculatingModel
	
	@State private var resultViewText: String = "0"
	
	@State private var firstInputNumber: String = ""
	@State private var nextInputNumber: String = ""
	@State private var usersOperator: String = ""
	
	@State private var usersLastInput: String = ""
	@State private var calculateResult: String = "" {
		didSet {
			calculatingManager.userCalculateHistory.append(calculateResult)
		}
	}
	
	@State private var isCalculating: Bool = false
	
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
					
					if !isCalculating {
						Text(firstInputNumber)
							.font(.system(size: 50))
							.foregroundColor(.white)
					} else if isCalculating, usersLastInput != "=" {
						Text(nextInputNumber)
							.font(.system(size: 50))
							.foregroundColor(.white)
					} else {
						Text(calculateResult)
							.font(.system(size: 50))
							.foregroundColor(.white)
					}
					
				
				}.padding([.vertical, .trailing], 15)
				
				ForEach(calculatorArray, id: \.self) { buttons in
					HStack {
						ForEach(buttons, id: \.self) { item in
							Button {
								// 계산 시작 전, 모든 입력은 마지막 인풋에 저장하도록 한다.
								switch item.buttonCatergory {
								case "number":
									if !isCalculating {
										// 계산이 시작되지 않으면 첫번째에 넣고
										firstInputNumber += item.buttonName
									} else { // 계산 중이면 앞으로 계속 두번째 숫자에 이어서 넣을거야
										nextInputNumber += item.buttonName
									}
								case "operator":
									if !isCalculating {
										// 계산이 이제 시작될 거니까 연산자를 할당한다.
										usersOperator = item.buttonName
										isCalculating = true
									} else {
										// 계산 중인데 다시 연산자가 눌렸다면? 마지막 인풋이 숫자면 계산하고 아니면 어떠케하지
										// 등호가 오면 계산시작
										if item.buttonName == "AC" {
											allClear()
											print("All Cleared")
										} else if usersLastInput == "=", item.buttonName != "=" {
											// 유저가 등호를 입력하여 결과를 확인했는데 다시 연산하고 싶을 경우
											// 결과를 1번 숫자로 옮기고 다시 숫자를 받아올 수 있게 nextInputNumber 초기화
											firstInputNumber = calculateResult
											nextInputNumber = ""
										} else if usersLastInput == "=", item.buttonName == "=" {
											// 만약 결과를 확인한 상태로 등호를 계속 누르면 이전의 숫자와 연산자로 연속계산한다.
											startSerialCalculate()
										} else if usersLastInput != "=", item.buttonName == "=" {
											// 일반계산
											startCalculate()
										}
									}
									usersLastInput = item.buttonName
									
								default:
									print(item.buttonName, item.buttonCatergory)
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
	
	private func startCalculate() {
		switch usersOperator {
		case "+":
			calculateResult = String(Double(firstInputNumber)! + Double(nextInputNumber)!)
			print(calculateResult)
		case "-":
			calculateResult = String(Double(firstInputNumber)! - Double(nextInputNumber)!)
			print(calculateResult)
		case "*":
			calculateResult = String(Double(firstInputNumber)! * Double(nextInputNumber)!)
			print(calculateResult)
		case "/":
			calculateResult = String(Double(firstInputNumber)! / Double(nextInputNumber)!)
			print(calculateResult)
		default:
			print(usersOperator)
		}
	}
	
	private func startSerialCalculate() {
		switch usersOperator {
		case "+":
			calculateResult = String(Double(calculateResult)! + Double(nextInputNumber)!)
			print(calculateResult)
		case "-":
			calculateResult = String(Double(calculateResult)! - Double(nextInputNumber)!)
			print(calculateResult)
		case "*":
			calculateResult = String(Double(calculateResult)! * Double(nextInputNumber)!)
			print(calculateResult)
		case "/":
			calculateResult = String(Double(calculateResult)! / Double(nextInputNumber)!)
			print(calculateResult)
		default:
			print(usersOperator)
		}
	}
	
	private func allClear() {
		isCalculating = false
		
		firstInputNumber = ""
		nextInputNumber = ""
		usersOperator = ""
		usersLastInput = ""
		resultViewText = ""
		calculateResult = ""
	}
	
}

enum Calculator: Int {
	case first = 0, second, third, fourth, fifth, sixth, seventh, eighth, nineth, zero1, zero2, dot
	case plus = 20, minus, multiply, divide, equal
	case percent = 30, oppsite, clear
	
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
	
	var buttonCatergory: String {
		switch self.rawValue {
		case 0...11:
			return "number"
		case 20...:
			return "operator"
		default:
			return "unknown"
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
