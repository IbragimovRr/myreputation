//
//  ProfileViewController.swift
//  myReputation
//
//  Created by Руслан on 06.12.2022.
//

import UIKit

class ProfileViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var newpsw: UITextField!
    @IBOutlet weak var oldpsw: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        phone.delegate = self
    }
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        newpsw.resignFirstResponder()
        oldpsw.resignFirstResponder()
        email.resignFirstResponder()
        name.resignFirstResponder()
        phone.resignFirstResponder()
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
        return true
    }

    

}
