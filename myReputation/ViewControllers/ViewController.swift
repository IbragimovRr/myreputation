//
//  ViewController.swift
//  myReputation
//
//  Created by Руслан on 05.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var im: UIImageView!
    @IBOutlet weak var btnText: UILabel!
    @IBOutlet weak var slider: UIImageView!
    
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        verst()
    }
    
    func radians (radians: CGFloat) -> CGFloat {
        return radians * CGFloat.pi / 180
    }

    func verst(){
        self.navigationController?.isNavigationBarHidden = true
        im.transform = im.transform.rotated(by: radians(radians: -15))
    }
    
    func glavn(sender:UIButton,bool:Bool){
        if bool {
            sender.tag -= 1
        }else {
            sender.tag += 1
        }
        
        switch sender.tag {
        case 0:
            im.image = UIImage(named: "start1")
            slider.image = UIImage(named: "Slider1")
            title1.text = "Analyze"
            title2.text = "reputation"
        case 1:
            im.image = UIImage(named: "start2")
            slider.image = UIImage(named: "Slider2")
            btnText.text = "Next"
            title1.text = "Form"
            title2.text = "an image"
        case 2:
            im.image = UIImage(named: "start3")
            slider.image = UIImage(named: "Slider3")
            btnText.text = "Start"
            title1.text = "Accessible"
            title2.text = "and convenient"
        default:
            print("")
        }
    }
    
    @IBAction func next(_ sender: UIButton) {
        print(sender.tag)
        glavn(sender: sender, bool: false)
        if sender.tag == 3 {
            performSegue(withIdentifier: "next", sender: self)
        }
    }
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        if btn.tag != 0{

            glavn(sender: btn, bool: true)
            
            print("left")
        }
    }
    
    @IBAction func left(_ sender: UISwipeGestureRecognizer) {
        glavn(sender: btn, bool: false)
        print("right")
        
    }
}

