//
//  ViewController.swift
//  calculationImpl
//
//  Created by 이승준 on 2022/10/14.
//

import UIKit

class ViewController: UIViewController {
    
    var nowCalculating: Bool = false
    var curruntCalculator: String = ""
    var userInput: String = ""

    @IBOutlet weak var userInputFirstField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUserInputField()
    }
    
    private func configUserInputField() {
        userInputFirstField.isUserInteractionEnabled = false
        userInputFirstField.keyboardType = .numberPad
        userInputFirstField.text = ""
    }
    
    @IBAction func numberBtnTapped(_ sender: UIButton) {
        guard let numberStr = sender.titleLabel?.text else { return }
        if nowCalculating {
            userInput += numberStr
        } else {
            userInput += numberStr
        }
    }
    
    @IBAction func calculateBtnTapped(_ sender: UIButton) {
        guard let calculator = sender.titleLabel?.text else { return }
        switch calculator {
        case "+":
            nowCalculating = true
            self.curruntCalculator = calculator
        case "-":
            nowCalculating = true
            self.curruntCalculator = calculator
        case "×":
            nowCalculating = true
            self.curruntCalculator = calculator
        case "÷":
            nowCalculating = true
            self.curruntCalculator = calculator
        case "=" :
            print("Get result")
//            resultLabel.text = doCalculate(userInput: userInputArr)
            nowCalculating = false
        case "←" :
            if nowCalculating {
                userInput.removeLast()
            } else {
                userInput.removeLast()
            }
        default:
            dump("DEBUG: NO 연산자")
        }
    }
    
    // 텍스트필드 입력값이랑 연산자
    func doCalculate(userInput: [String]) -> String {
        switch self.curruntCalculator {
        case "+":
            print(#function)
            let result = Int(userInput[0])! + Int(userInput[1])!
            return String(result)
        case "-":
            let result = Int(userInput[0])! - Int(userInput[1])!
            return String(result)
        case "*":
            let result = Int(userInput[0])! * Int(userInput[1])!
            return String(result)
        case "/":
            if userInput[1] == "0" {
                return "오류"
            } else {
                let result = Int(userInput[0])! / Int(userInput[1])!
                return String(result)
            }
        default:
            print()
        }
        return ""
    }
}

