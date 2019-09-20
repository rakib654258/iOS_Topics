//
//  ViewController.swift
//  Segment with Contrainer View
//
//  Created by macOS Mojave on 20/9/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        menuView.alpha = 0.0
        secondView.alpha = 0.0
    }

    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex==0{
            
            UIView.animate(withDuration: 0.3) {
                self.firstView.alpha = 1.0
                self.secondView.alpha = 0.0
            }
            
        }else{
            UIView.animate(withDuration: 0.3) {
                self.firstView.alpha = 0.0
                self.secondView.alpha = 1.0
            }
        }
    }
    
    @IBAction func menuAction(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 0.3) {
            self.menuView.alpha = 0.9
        }
    }
}

