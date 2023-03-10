//
//  RegistrationViewController.swift
//  myReputation
//
//  Created by Руслан on 12.12.2022.
//

import UIKit

class RegistrationViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var step2: UIButton!
    @IBOutlet weak var verif: UITextField!
    @IBOutlet weak var tel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        step2.layer.borderWidth = 1
        step2.layer.borderColor = UIColor.black.cgColor
        step2.layer.cornerRadius = 10
        tel.delegate = self
        tel.setLeftPaddingPoints(50)
        verif.setLeftPaddingPoints(50)
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        tel.resignFirstResponder()
        verif.resignFirstResponder()
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
    
    
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func step1(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
}
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
