//
//  FormVC.swift
//  Protocol & Delegate Demo
//
//  Created by RakiB on 8/1/20.
//  Copyright © 2020 RakiB. All rights reserved.
//

import UIKit

protocol DataPass {
    func dataPassing(name:String,age:String,city:String)
}
class FormVC: UIViewController {
    
    @IBOutlet weak var textFieldLbl: UITextField!
    @IBOutlet weak var ageTextFieldLbl: UITextField!
    @IBOutlet weak var cityTextFieldLbl: UITextField!
    
    var delegate:DataPass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Form View Controller"
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        // Do any additional setup after loading the view.
    }

    @IBAction func saveAction(_ sender: UIButton) {
        delegate.dataPassing(name: textFieldLbl.text!, age: ageTextFieldLbl.text!, city: cityTextFieldLbl.text!)
        
    }
    @IBAction func cancelAction(_ sender: UIButton) {
        //self.dismiss(animated: true, completion: nil)
        //self.navigationController!.dismiss(animated: true, completion: nil)
    }
}
