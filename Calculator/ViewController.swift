//
//  ViewController.swift
//  Calculator
//
//  Created by Adilet Kenesbekov on 04.10.2024.
//
//dsadad
import UIKit

class ViewController: UIViewController {

    var firstNum : String  = ""
    var operation : String = ""
    var secondNum : String = ""
    var haveRes : Bool = false
    var result : String = ""
    var numafterRes : String = ""
    var isNegative : Bool = false
    
    @IBOutlet weak var numScreen: UILabel!
    
    @IBAction func numPress(_ sender: UIButton) {
        if operation == "" {
            firstNum += String(sender.tag)
            numScreen.text = firstNum
        }
        else if operation != "" && !haveRes {
            secondNum += String(sender.tag)
            numScreen.text = secondNum
        }
        else if operation != "" && haveRes {
            numafterRes += String(sender.tag)
            numScreen.text = numafterRes
        }
    }
    
    @IBAction func screenClear(_ sender: UIButton) {
        firstNum  = ""
        operation = ""
        secondNum = ""
        haveRes = false
        result = ""
        numafterRes = ""
        isNegative = false
        numScreen.text = "0"
    }
    
    @IBAction func divide(_ sender: UIButton) {
        operation = "/"
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        operation = "*"
    }
    
    @IBAction func substract(_ sender: UIButton) {
        operation = "-"
    }
    @IBAction func add(_ sender: UIButton) {
        operation = "+"
    }
    @IBAction func modulePercent(_ sender: UIButton) {
        operation = "%"
        
        firstNum = String(Double(firstNum)! / 100)
        numScreen.text = firstNum
    }
    
    @IBAction func convertNegative(_ sender: UIButton) {
        if operation == "" {
                // Handle firstNum toggle
                if !firstNum.isEmpty {
                    let number = Double(firstNum)!
                    let toggledNumber = number * -1
                    firstNum = String(toggledNumber)
                    numScreen.text = firstNum
                }
            } else if operation != "" && !haveRes {
                // Handle secondNum toggle
                if !secondNum.isEmpty {
                    let number = Double(secondNum)!
                    let toggledNumber = number * -1
                    secondNum = String(toggledNumber)
                    numScreen.text = secondNum
                }
            } else if operation != "" && haveRes {
                // Handle numafterRes toggle if needed
                if !numafterRes.isEmpty {
                    let number = Double(numafterRes)!
                    let toggledNumber = number * -1
                    numafterRes = String(toggledNumber)
                    numScreen.text = numafterRes
                }
            }
    }
    
    @IBAction func comma(_ sender: UIButton) {
        if operation == "" {
                if !firstNum.contains(".") {
                    if firstNum.isEmpty {
                        firstNum = "0."
                    } else {
                        firstNum += "."
                    }
                    numScreen.text = firstNum
                }
            } else if operation != "" && !haveRes {
                if !secondNum.contains(".") {
                    if secondNum.isEmpty {
                        secondNum = "0."
                    } else {
                        secondNum += "."
                    }
                    numScreen.text = secondNum
                }
            } else if operation != "" && haveRes {
                if !numafterRes.contains(".") {
                    if numafterRes.isEmpty {
                        numafterRes = "0."
                    } else {
                        numafterRes += "."
                    }
                    numScreen.text = numafterRes
                }
            }
    }
    
    
    @IBAction func equal(_ sender: UIButton) {
        let calcResult = calcOperations()

        if calcResult.truncatingRemainder(dividingBy: 1) == 0 {
            result = String(Int(calcResult))
        } else {
            result = String(calcResult)
        }

        numScreen.text = result
        numafterRes = ""
    }

    
    
    
    
    
    
    
    func calcOperations() -> Double {
        if operation == "+" {
            if !haveRes{
                haveRes = true
                return Double(firstNum)! + Double(secondNum)!
            }
            else {
                return Double(result)! + Double(numafterRes)!
            }
        }
        else if operation == "-" {
            if !haveRes{
                haveRes = true
                return Double(firstNum)! - Double(secondNum)!
            }
            else {
                return Double(result)! - Double(numafterRes)!
            }
        }
        else if operation == "/" {
            if !haveRes{
                haveRes = true
                return Double(firstNum)! / Double(secondNum)!
            }
            else{
                return Double(result)! / Double(numafterRes)!
            }
        }
        else if operation == "*" {
            if !haveRes {
                haveRes = true
                return Double(firstNum)! * Double(secondNum)!
            }
            else {
                return Double(result)! * Double(numafterRes)!
            }
        }

        return 0
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
}

