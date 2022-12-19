//
//  LogInViewController.swift
//  myReputation
//
//  Created by Руслан on 05.12.2022.
//

import UIKit

class LogInViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var err: UIImageView!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        login.delegate = self
        
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "+X XXX XXX XX XX", phone: newString)
        return false
    }
    

    @IBAction func loginbtn(_ sender: UIButton) {
        err.isHidden = false
    }
    

    @IBAction func pass(_ sender: UIButton) {
        if sender.tag == 0 {
            password.isSecureTextEntry = false
            sender.tag = 1
        }else {
            sender.tag = 0
            password.isSecureTextEntry = true
        }
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        login.resignFirstResponder()
        password.resignFirstResponder()
        
    }
}
