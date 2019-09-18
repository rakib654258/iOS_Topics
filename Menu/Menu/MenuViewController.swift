//
//  MenuViewController.swift
//  Menu
//
//  Created by macOS Mojave on 28/8/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var menuRight: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        menuRight.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.
    }
    @objc func tapGestureAction(){
        dismiss(animated: true, completion: nil)
    }

}
