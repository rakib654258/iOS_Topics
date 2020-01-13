//
//  ViewController.swift
//  CusLoginRegisFirestore
//
//  Created by RakiB on 9/1/20.
//  Copyright © 2020 RakiB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //navigationController?.navigationBar.isHidden = true
        setUpElements()
    }
    //seting up button style
    func setUpElements(){
        Utilities.styledFilledButton(loginBtn)
        Utilities.styledUnfieldButton(signupBtn)
    }

    @IBAction func loginAction(_ sender: UIButton) {
    }
    @IBAction func signUpAction(_ sender: UIButton) {
    }
    
}

