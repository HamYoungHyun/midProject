//
//  ResultViewController.swift
//  midproject
//
//  Created by SWUCOMPUTER on 2020/05/03.
//  Copyright © 2020 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultText: UILabel!
    @IBOutlet var optionPicker: UIPickerView!
    @IBOutlet var answerView: UIView!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var pickerButton: UIButton!
    
    var answer: Bool!
    var answerText: String! = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerView.isHidden = true
        
        if answer == true {
            resultLabel.text = "O"
            resultText.text = "정답입니다!!"
            optionPicker.isHidden = true
            pickerButton.isHidden = true
        } else {
            resultLabel.text = "X"
            resultText.text = ""
            self.view.backgroundColor = UIColor.init(
            red: CGFloat(0),
            green: CGFloat(0),
            blue: CGFloat(0), alpha: 0.0)
            if let contentString = answerText {
                answerLabel.text = contentString
            }
        }

        // Do any additional setup after loading the view.
    }
    
    let optionArray: Array<String> = ["오답입니다!", "정답 보기"]
    
    @IBAction func optionAction(_ sender: UIButton) {
        let option: String = optionArray[self.optionPicker.selectedRow(inComponent: 0)]
        
        if (option == "정답 보기") {
            self.answerView.isHidden = false
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return optionArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return optionArray[row]
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
