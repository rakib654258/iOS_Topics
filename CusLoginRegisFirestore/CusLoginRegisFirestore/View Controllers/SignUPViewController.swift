//
//  SignUPViewController.swift
//  CusLoginRegisFirestore
//
//  Created by RakiB on 9/1/20.
//  Copyright © 2020 RakiB. All rights reserved.

// pass - rakib123!

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUPViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var bloodGroupLbl: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var signUpBtnLbl: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements(){
        //hide error label
        errorLbl.alpha = 0
        
        Utilities.styleTextField(nameTF)
        Utilities.styleTextField(ageTF)
        Utilities.styleTextField(bloodGroupLbl)
        Utilities.styleTextField(mobileTF)
        Utilities.styleTextField(emailTF)
        Utilities.styleTextField(passwordTF)
        
        Utilities.styledFilledButton(signUpBtnLbl)
    }
    
    //Check the fields and validate that the data is correct. If everything is correct, this method returns nil. otherwise, it returns the error message.
    func validateFields() -> String?{
        // check that all fields are filled
        if nameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || ageTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || bloodGroupLbl.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || mobileTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all fields"
        }
        // Check if the password is sequre
        let cleanedPassword = passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword!) == false{
            //password isn't sequre enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        return nil
    }

    // MARK: - Register Button
    @IBAction func registerAction(_ sender: UIButton) {
        //Validate the fields
        let error = validateFields()
        if error != nil{
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else{
            //Create cleaned versions of the data
            let name = nameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let age = ageTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let bloodGroup = bloodGroupLbl.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let mobile = mobileTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Create the user
            Auth.auth().createUser(withEmail: email!, password: password!) { (result, err) in
                // check for error
                if err != nil{
                    //there was an error creating the user
                    //err?.localizedDescription
                    self.showError("Error creating user.")
                }else{
                    //user was created successfully, now store the name,age, ...
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["name": name, "age": age, "blood Group": bloodGroup, "mobile": mobile, "uid": result?.user.uid]) { (error) in
                        if error != nil{
                            //show error
                            self.showError("Error, saving user data")
                        }
                    }
                    //Transition to the home screen
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
