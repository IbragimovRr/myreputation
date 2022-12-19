//
//  AuditViewController.swift
//  myReputation
//
//  Created by Руслан on 08.12.2022.
//

import UIKit

class AuditViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var viewB: NSLayoutConstraint!
    @IBOutlet weak var scrrec: UIScrollView!
    @IBOutlet weak var rech: NSLayoutConstraint!
    @IBOutlet weak var recCol: UICollectionView!
    @IBOutlet weak var hrec: NSLayoutConstraint!
    @IBOutlet weak var problems: UICollectionView!
    @IBOutlet weak var reptext: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var animim: UIImageView!
    @IBOutlet weak var anim: UIView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var btnBIG: UIView!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var aud: UIView!
    @IBOutlet weak var hcol: NSLayoutConstraint!
    var animator: UIViewPropertyAnimator?
    var animator2: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        problems.delegate = self
        problems.dataSource = self
        recCol.delegate = self
        recCol.dataSource = self
        b(button: btn1)
        b(button: btn2)
        b(button: btn3)
        b(button: btn4)
        b(button: btn5)
        b(button: btn6)
        scroll.delegate = self
        animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            self.anim.transform = CGAffineTransform(scaleX: 1.0, y: 0.5).translatedBy(x: 0, y: -160)
            self.scroll.transform = CGAffineTransform(translationX: 0, y: -160)
            self.number.transform = CGAffineTransform(scaleX: 1.0, y: 1.5)
            self.reptext.transform = CGAffineTransform(scaleX: 1.0, y: 1.5)
            self.animim.alpha = 0
            self.aud.alpha = 0
        })
        animator2 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            self.anim.transform = .identity
            
        })
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        animator!.stopAnimation(true)
        
        if let animator = animator, animator.state != .inactive {
            animator.finishAnimation(at: .current)
        }
        
        animator2!.stopAnimation(true)
        
        if let animator = animator2, animator2!.state != .inactive {
            animator.finishAnimation(at: .current)
        }
    }
    
    func b(button:UIButton){
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "gray")?.cgColor
        button.layer.cornerRadius = 15
        btnBIG.layer.borderWidth = 1
        btnBIG.layer.borderColor = UIColor(named: "gray")?.cgColor
        btnBIG.layer.cornerRadius = 15
    }
    
    func b2(){
        btn1.backgroundColor = UIColor.white
        btn1.setTitleColor(UIColor.black, for: .normal)
        btn2.setTitleColor(UIColor.black, for: .normal)
        btn3.setTitleColor(UIColor.black, for: .normal)
        btn4.setTitleColor(UIColor.black, for: .normal)
        btn5.setTitleColor(UIColor.black, for: .normal)
        btn6.setTitleColor(UIColor.black, for: .normal)
        btn2.backgroundColor = UIColor.white
        btn3.backgroundColor = UIColor.white
        btn4.backgroundColor = UIColor.white
        btn5.backgroundColor = UIColor.white
        btn6.backgroundColor = UIColor.white
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y > 0{
            animator?.fractionComplete = scrollView.contentOffset.y/100
        }else {
            animator2?.fractionComplete = -scrollView.contentOffset.y/100
        }
    }

    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        print(translation.y)
        if sender.state == .changed{
            if translation.y < 0 {
                hrec.constant = -translation.y + 120
            }else {
                hrec.constant = -translation.y + scroll.bounds.height
            }
            
        }else if sender.state == .ended {
            if translation.y < 0 {
                
                viewB.constant = 0
                scrrec.isHidden = false
            }else {
                viewB.constant = scroll.bounds.height - 120
                scrrec.isHidden = true
            }
        }
    }
    
    @IBAction func btnall(_ sender: UIButton) {
        
        
    }
    
}
extension AuditViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == problems{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellrec", for: indexPath)
            return cell2
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        hcol.constant = 190 * 5 + 95
        rech.constant = 159 * 5 + 80
        if collectionView == problems{
            let wid = UIScreen.main.bounds.width - 48
            return CGSize(width: wid, height: 190)
        }else {
            let wid = UIScreen.main.bounds.width - 48
            return CGSize(width: wid, height: 159)
        }
        
    }
    
    
}
