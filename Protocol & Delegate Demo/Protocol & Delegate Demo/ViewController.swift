//
//  ViewController.swift
//  Protocol & Delegate Demo
//
//  Created by RakiB on 8/1/20.
//  Copyright © 2020 RakiB. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataPass {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goFormAction(_ sender: UIButton) {
        let formViewController = self.storyboard?.instantiateViewController(identifier: "formVC") as! FormVC
        formViewController.delegate = self
        self.navigationController?.pushViewController(formViewController, animated: true)
    }
    func dataPassing(name: String, age: String, city: String) {
        nameLbl.text = name
        ageLbl.text = age
        cityLbl.text = city
    }
    
}

