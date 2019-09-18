//
//  ViewController.swift
//  customTextField
//
//  Created by macOS Mojave on 5/3/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var cardLavel: SkyFloatingLabelTextFieldWithIcon!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardLavel.iconType = .image
        cardLavel.iconImage = UIImage(imageLiteralResourceName: "card")
//        let textFieldframe = CGRect(x: 16, y: 35, width: 343, height: 45)
        //let textField1 = SkyFloatingLabelTextFieldWithIcon(frame: textFieldframe, iconType: .image)
//        textField1.placeholder = "Enter Your Card Number"
//        textField1.title = "Card Number"

//        textField1.iconImage = UIImage(imageLiteralResourceName: "card")
//        self.view.addSubview(textField1)

        // Do any additional setup after loading the view, typically from a nib.
//        nameField.placeholder = "Name"
//        nameField.title = "Your full name"
//        self.view.addSubview(nameField)
    }
    
    

}

