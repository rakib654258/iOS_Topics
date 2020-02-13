//
//  ViewController.swift
//  Endediting Touches Began
//
//  Created by A.K.M. Sazzad Hossain on 2/13/20.
//  Copyright © 2020 A.K.M. Sazzad Hossain. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var inputField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //MARK: Keyboard delegate return key active
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //MARK: hide keyboard touches any where
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
    @IBAction func button(_ sender: Any) {
        hideKeyboard()
    }
    // MARK: hide keyboard
    func hideKeyboard(){
        self.view.endEditing(true)
    }
}

