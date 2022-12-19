//
//  CardViewController.swift
//  myReputation
//
//  Created by Руслан on 12.12.2022.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var cod: UITextField!
    @IBOutlet weak var mm: UITextField!
    @IBOutlet weak var card: UITextField!
    @IBOutlet weak var car: UIButton!
    @IBOutlet weak var applePay: UIButton!
    @IBOutlet weak var step3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        step3.layer.borderWidth = 1
        step3.layer.borderColor = UIColor.black.cgColor
        step3.layer.cornerRadius = 10
        card.setLeftPaddingPoints(50)
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        cod.resignFirstResponder()
        mm.resignFirstResponder()
        card.resignFirstResponder()
    }
    
    @IBAction func apP(_ sender: UIButton) {
        sender.backgroundColor = UIColor(named: "laym")
        car.backgroundColor = UIColor(named: "gr")
    }
    
    @IBAction func bankCard(_ sender: UIButton) {
        sender.backgroundColor = UIColor(named: "laym")
        applePay.backgroundColor = UIColor(named: "gr")
    }
    
}
