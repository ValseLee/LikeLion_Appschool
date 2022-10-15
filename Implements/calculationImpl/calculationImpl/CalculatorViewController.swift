//
//  ViewController.swift
//  calculationImpl
//
//  Created by 이승준 on 2022/10/14.
//

import UIKit

final class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var clearBtn: MyButton! {
        didSet {
            clearBtn.titleLabel?.textAlignment = .center
        }
    }
    
    var userInput = ["","",""]
    var onCalculating: Bool = false
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberBtnTapped(_ sender: UIButton) {
        if let userNumber = sender.titleLabel?.text {
            if userNumber == "." {
                userInput[0] = "0"
                resultLabel.text = userInput[0]
            }
            if userNumber == "0", resultLabel.text == "0" {
                dump("DEBUG: Do Nothing, serial 0's")
            } else if userNumber == ".", resultLabel.text == "." {
                dump("DEBUG: Do Nothing, serial .'s")
            } else if !onCalculating {
                userInput[0] += userNumber
                resultLabel.text = userInput[0]
            } else if onCalculating {
                userInput[1] += userNumber
                resultLabel.text = userInput[1]
            }
        }
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
                let result = startCalculate()
                userInput[0] = result
                userInput[1] = ""
                onCalculating = false
            case "AC":
                print("DEBUG: AC")
                allClear()
            case "+/-":
                print()
            case "%":
                print()
            default:
                print()
            }
        }
    }
    
    // MARK: Methods
    private func allClear() {
        userInput = ["","",""]
        resultLabel.text = "0"
        onCalculating = false
    }
    
    private func partialClear() {
        // 계산기의 C는 대체 어떻게 작동하는걸까..?
    }
    
    private func startCalculate() -> String {
        let userOperator = userInput[2]
        let lhs = userInput[0]
        let rhs = userInput[1]
        var result = ""
        
        defer {
            if result == "" {
                resultLabel.text = "0"
            } else {
                resultLabel.text = result
            }
        }
        
        switch userOperator {
        case "+":
            let tmp = Float(lhs)! + Float(rhs)!
            result = String(tmp)
            print(result)
            return result
        case "-":
            let tmp = Float(lhs)! - Float(rhs)!
            result = String(tmp)
            print(result)
            return result
        case "×":
            let tmp = Float(lhs)! * Float(rhs)!
            result = String(tmp)
            print(result)
            return result
        case "÷":
            let tmp = Float(lhs)! / Float(rhs)!
            result = String(tmp)
            print(result)
            return result
        default:
            print(#function, "??")
            return result
        }
    }
}
