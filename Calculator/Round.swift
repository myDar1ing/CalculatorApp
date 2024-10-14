//
//  Round.swift
//  Calculator
//
//  Created by Adilet Kenesbekov on 04.10.2024.
//

import UIKit

@IBDesignable
class Round: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
}
