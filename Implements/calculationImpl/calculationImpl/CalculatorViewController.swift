//
//  ViewController.swift
//  calculationImpl
//
//  Created by 이승준 on 2022/10/14.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    let btnArray: [UIButton] = []
    
    @IBOutlet weak var resultLabel: UILabel!
    var userInput = ["","",""]
    var onCalculating: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberBtnTapped(_ sender: UIButton) {
        if let userNumber = sender.titleLabel?.text {
            if !onCalculating {
                userInput[0] += userNumber
                resultLabel.text = userInput[0]
            } else {
                userInput[1] += userNumber
                resultLabel.text = userInput[1]
            }
        }
        print(#function, userInput)
    }
    
    @IBAction func operatorBtnTapped(_ sender: UIButton) {
        if let userOperator = sender.titleLabel?.text {
            onCalculating = true
            switch userOperator {
            case "+":
                userInput[2] = userOperator
            case "-":
                userInput[2] = userOperator
            case "×":
                userInput[2] = userOperator
            case "÷":
                userInput[2] = userOperator
            case "=":
                startCalculate()
            // All Clear
            case "AC":
                print()
                cancelCalculate()
            case "+/-":
                print()
            case "%":
                print()
            default:
                print()
            }
        }
    }
    
    private func cancelCalculate() {
        userInput = ["","",""]
        resultLabel.text = "0"
        onCalculating = false
    }
    
    private func startCalculate() {
        let userOperator = userInput[2]
        let lhs = userInput[0]
        let rhs = userInput[1]
        var result = ""
        
        switch userOperator {
        case "+":
            let tmp = Float(lhs)! + Float(rhs)!
            result = String(tmp)
            print(result)
        case "-":
            let tmp = Float(lhs)! - Float(rhs)!
            result = String(tmp)
            print(result)
        case "×":
            let tmp = Float(lhs)! * Float(rhs)!
            result = String(tmp)
            print(result)
        case "÷":
            let tmp = Float(lhs)! / Float(rhs)!
            result = String(tmp)
            print(result)
        default:
            print("??")
        }
        resultLabel.text = result
    }
}
