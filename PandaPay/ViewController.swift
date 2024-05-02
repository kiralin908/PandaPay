//
//  ViewController.swift
//  PandaPay
//
//  Created by 林郁琦 on 2024/4/16.
//

import UIKit

class ViewController: UIViewController {
    //把需要用到的UI元件拉進Outlet
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var peopleTextField: UITextField!
    @IBOutlet weak var averageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定輸入文字框預設提示文字
        priceTextField.placeholder = "請輸入金額"
        tipTextField.placeholder = "請輸入小費"
        peopleTextField.placeholder = "請輸入人數"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        //設定輸入文字框後,把鍵盤收起來
        priceTextField.resignFirstResponder()
        tipTextField.resignFirstResponder()
        peopleTextField.resignFirstResponder()
        
        //判斷輸入文字框沒有填寫時為0
        if priceTextField.text == "" || tipTextField.text == "" || peopleTextField.text == "" {
            priceTextField.text = "0"
            tipTextField.text = "0"
            averageLabel.text = "0"
        } else {
            //計算稅金，並顯示到Lebal上
            let tip = Double(priceTextField.text!)! * Double(tipTextField.text!)! / 100
            let total = Double(priceTextField.text!)! + tip
            let share = total / Double(peopleTextField.text!)!
            averageLabel.text = String(share)
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        //設定清除所有文字框
        priceTextField.text = ""
        tipTextField.text = ""
        peopleTextField.text = ""
        averageLabel.text = "0"
    }
}

