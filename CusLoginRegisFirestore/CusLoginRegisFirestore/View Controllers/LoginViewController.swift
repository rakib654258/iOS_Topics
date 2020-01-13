//
//  LoginViewController.swift
//  CusLoginRegisFirestore
//
//  Created by RakiB on 9/1/20.
//  Copyright © 2020 RakiB. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var signInBtnLbl: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements(){
        errorLbl.alpha = 0
        Utilities.styleTextField(emailTF)
        Utilities.styleTextField(passwordTF)
        Utilities.styledFilledButton(signInBtnLbl)
    }
    func validateFields() -> String?{
         // check that all fields are filled
         if emailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
             return "Please fill in all fields"
         }
         return nil
     }
    // MARK: - Signin Action
    @IBAction func signinAction(_ sender: UIButton) {
        //validate textFields
        let error = validateFields()
        if error != nil{
            // There's something wrong with the fields, show error message
            showError(error!)
        }else{
            //Created cleaned versions of the text field
            let email = emailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //signing in the user
            Auth.auth().signIn(withEmail: email!, password: password!) { (result, err) in
                if err != nil{
                    //couldn't sign in
                    self.errorLbl.text = err?.localizedDescription
                    self.errorLbl.alpha = 1
                }else{
                    self.homeTransition()
                }
            }

        }
    }
    
    func showError(_ message:String){
        errorLbl.text = message
        errorLbl.alpha = 1
    }
    func homeTransition(){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
