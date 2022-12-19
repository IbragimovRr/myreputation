//
//  YourObjectViewController.swift
//  myReputation
//
//  Created by Руслан on 12.12.2022.
//

import UIKit



class YourObjectViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var doc: UIView!
    @IBOutlet weak var file: UITextField!
    @IBOutlet weak var info: UITextField!
    @IBOutlet weak var addlink: UITextField!
    @IBOutlet weak var step1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        step1.layer.borderWidth = 1
        step1.layer.borderColor = UIColor.black.cgColor
        step1.layer.cornerRadius = 10
    }
    
    @IBAction func close(_ sender: UIButton) {
        doc.isHidden = true
    }
    
    @IBAction func add(_ sender: UIButton) {
        doc.isHidden = false
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        file.resignFirstResponder()
        info.resignFirstResponder()
        addlink.resignFirstResponder() 
    }
    
    @IBAction func document(_ sender: UIButton) {
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.text", "com.apple.iwork.pages.pages", "public.data"], in: .import)

            documentPicker.delegate = self
            present(documentPicker, animated: true, completion: nil)
    }
    @IBAction func file(_ sender: UIButton) {
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.text", "com.apple.iwork.pages.pages", "public.data"], in: .import)

            documentPicker.delegate = self
            present(documentPicker, animated: true, completion: nil)
    }
    
    @IBAction func camera(_ sender: UIButton) {
        
    }
    @IBAction func galery(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let img = UIImagePickerController()
        img.delegate = self
            img.sourceType = UIImagePickerController.SourceType.photoLibrary
        //img.mediaTypes = [kUTTypeImage]; //whatever u want type
        img.allowsEditing = false
            self.present(img, animated: true, completion: nil)
      }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension YourObjectViewController: UIDocumentPickerDelegate{
    
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {

              let cico = url as URL
              print(cico)
              print(url)

              print(url.lastPathComponent)

              print(url.pathExtension)

             }
 }
