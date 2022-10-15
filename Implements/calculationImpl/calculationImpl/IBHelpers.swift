//
//  IBHelpers.swift
//  calculationImpl
//
//  Created by 이승준 on 2022/10/15.
//

import Foundation
import UIKit

@IBDesignable final class MyButton: UIButton {
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    private func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
    
}
