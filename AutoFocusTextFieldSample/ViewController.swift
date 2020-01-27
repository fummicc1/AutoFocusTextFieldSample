//
//  ViewController.swift
//  AutoFocusTextFieldSample
//
//  Created by Fumiya Tanaka on 2020/01/27.
//  Copyright © 2020 Fumiya Tanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var thirdTextField: UITextField!
    @IBOutlet var fourthTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        thirdTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        fourthTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
    
	@objc func textDidChange(_ textField: UITextField) {
		
		// 入力した文字を変数に格納
		let text = textField.text!
		
		// 次に進むか・前に戻るか
		var isBack: Bool = false
		
		// 空だったら、１つ前に戻る
        if text.isEmpty {
			// 前に戻るように設定する
			isBack = true
		}
        
        switch textField {
			
        case firstTextField:
            
			// 前に戻るか次に進むかをif文で確認する
            if isBack == false {
                secondTextField.becomeFirstResponder()
            }
            
        case secondTextField:
            
			// 前に戻るか次に進むかをif文で確認する
            if isBack == true {
                firstTextField.becomeFirstResponder()
            } else {
                thirdTextField.becomeFirstResponder()
            }
            
        case thirdTextField:
            
			// 前に戻るか次に進むかをif文で確認する
            if isBack == true {
                secondTextField.becomeFirstResponder()
            } else {
                fourthTextField.becomeFirstResponder()
            }
            
        case fourthTextField:
            
			// 前に戻るか次に進むかをif文で確認する
			if isBack == true {
				thirdTextField.becomeFirstResponder()
			} else {
				fourthTextField.resignFirstResponder()
			}
        default:
            break
        }
    }
}
