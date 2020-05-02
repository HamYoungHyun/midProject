//
//  ViewController.swift
//  midproject
//
//  Created by SWUCOMPUTER on 2020/05/02.
//  Copyright © 2020 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet var num1: UILabel!
    @IBOutlet var num2: UILabel!
    @IBOutlet var num3: UILabel!
    @IBOutlet var operation1: UILabel!
    @IBOutlet var operation2: UILabel!
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var textEntry: UITextField!
    @IBOutlet var questionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        questionView.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //문제 답 계산
        var result: String = ""
        
        let number1 = Int(num1.text!)!
        let number2 = Int(num2.text!)!
        let number3 = Int(num3.text!)!
        
        if (operation1.text == "+") && (operation2.text == "+") {
            result = String(number1 + number2 + number3)
        } else if (operation1.text == "+") && (operation2.text == "-") {
                result = String(number1 + number2 - number3)
        } else if (operation1.text == "-") && (operation2.text == "+") {
            result = String(number1 - number2 + number3)
        } else if (operation1.text == "-") && (operation2.text == "-") {
                result = String(number1 - number2 - number3)
        }
        
        if segue.identifier == "toResultView" {
            let destVC = segue.destination as! ResultViewController
            
            if (displayLabel.text == result) {
                destVC.answer = true
            } else {
                destVC.answer = false
                var outString: String = "정답은 <"
                outString += result
                outString += "> 입니다."
                destVC.answerText = outString
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func questionCreate(_ sender: UIButton) {
        questionView.isHidden = false
        var originalNumbers = Array (1 ... 99)
        var operations: Array<String> = ["+", "-"]
        var index = 0
        var index2 = 0
        var numberArray = Array<Int>()
        var operationArray = Array<String>()
        
        for _ in 0 ... 2 {
            index = Int(arc4random_uniform(UInt32(originalNumbers.count)))
            numberArray.append(originalNumbers[index])
            originalNumbers.remove(at: index)
        }
        num1.text = String(numberArray[0])
        num2.text = String(numberArray[1])
        num3.text = String(numberArray[2])
        
        for _ in 0 ... 1 {
            index2 = Int(arc4random_uniform(UInt32(operations.count)))
            operationArray.append(operations[index2])
            operations.remove(at: index2)
        }
        operation1.text = String(operationArray[0])
        operation2.text = String(operationArray[1])
    }
    
    @IBAction func displayButton(_ sender: UIButton) {
        displayLabel.text = String(textEntry.text!)
    }
}

