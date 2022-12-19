//
//  AboutViewController.swift
//  myReputation
//
//  Created by Руслан on 07.12.2022.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var labelnav: UILabel!
    @IBOutlet weak var viewnav: UIView!
    @IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.delegate = self
        
    }
    

    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension AboutViewController:UIScrollViewDelegate {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scr = scrollView.contentOffset.y
        if scr < 0.0 {
            labelnav.text = "Audit"
            viewnav.backgroundColor = .white.withAlphaComponent(1.0)
        }else {
            viewnav.backgroundColor = .black.withAlphaComponent(0.1)
        }
        print(scr)
        
        if scr > 14.0 && scr < 229.0 {
            labelnav.text = "About"
        }else if scr > 229 && scr < 700.0 {
            labelnav.text = "How it works"
        }else  if scr > 700 && scr < 1282 {
            labelnav.text = "Exsample of work"
        }else if scr > 1282{
            labelnav.text = "Quality assurance"
        }
        
    }
    
    
}
