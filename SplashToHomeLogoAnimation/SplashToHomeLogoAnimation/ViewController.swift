//
//  ViewController.swift
//  SplashToHomeLogoAnimation
//
//  Created by user on 28/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoLbl: UIImageView!
    
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var loginBtnLbl: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var logoTopCons: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logoTopCons.constant = -64
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

           self.view.layoutIfNeeded()
           self.logoTopCons.constant = -200
//           self.logoWidthConstraint.constant = 80
        self.logoLbl.alpha = 0.5
        self.emailTF.alpha = 0.0
        self.passTF.alpha = 0.0
        self.loginBtnLbl.alpha = 0.0
        UIView.animate(withDuration: 1.0, animations:
           {
               self.logoLbl.alpha = 1.0
            self.emailTF.alpha = 1.0
            self.passTF.alpha = 1.0
            self.loginBtnLbl.alpha = 1.0
               self.view.layoutIfNeeded()
           })
    }

}

