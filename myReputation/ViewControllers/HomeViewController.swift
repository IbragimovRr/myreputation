//
//  HomeViewController.swift
//  myReputation
//
//  Created by Руслан on 06.12.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var cardbackSecond: UIView!
    @IBOutlet weak var cardback: UIView!
    @IBOutlet weak var cardGlavn: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        card()
        
    }
    

    func card() {
        cardback.layer.borderWidth = 1
        cardback.layer.borderColor = UIColor(named: "cardColor")?.cgColor
        cardbackSecond.layer.borderWidth = 1
        cardbackSecond.layer.borderColor = UIColor(named: "cardColor")?.cgColor
    }
    

}
