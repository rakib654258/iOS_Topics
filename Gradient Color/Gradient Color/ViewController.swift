//
//  ViewController.swift
//  Gradient Color
//
//  Created by macOS Mojave on 8/3/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelViewOutlet: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Clear the labelView background color
        labelViewOutlet.backgroundColor = .clear
        createGradient()
    }
    
    //Create a function for gradient color
    func createGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        //for color bombination
        //gradientLayer.colors = [UIColor(red: 238/256,green:170/256, blue: 17/256, alpha: 1).cgColor,UIColor.red.cgColor,UIColor.green.cgColor]
        gradientLayer.colors = [UIColor.yellow.cgColor,UIColor.red.cgColor,UIColor.black.cgColor]
        //For Engling gradient color
        //layer.startPoint = CGPoint(x: 0, y: 0)
        //layer.endPoint = CGPoint(x: 1, y: 1)
        //Spacify where we want to add our graidentLayer
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }


}

