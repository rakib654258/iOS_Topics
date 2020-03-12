//
//  ViewController.swift
//  ContrainerTest
//
//  Created by RakiB on 12/3/20.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contrainerView: UIView!
    
    var navController1 = UINavigationController()
    var navController2 = UINavigationController()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        //navController1
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "ContrainerVC1") as! ContrainerVC1
        navController1 = UINavigationController(rootViewController: VC1)
        navController1.isNavigationBarHidden = true

        
        //navController2
        let VC2 = self.storyboard!.instantiateViewController(withIdentifier: "ContrainerVC2")
        navController2 = UINavigationController(rootViewController: VC2)
        navController2.isNavigationBarHidden = true
        


        let btn = UIButton()
        btn.tag = 1
        self.ActionOnSideMenuButtons(sender: btn)
    }

    @IBAction func ActionOnSideMenuButtons(sender: AnyObject)
    {
        for view in contrainerView.subviews{
            view.removeFromSuperview()
        }
        switch sender.tag
        {
        case 1:// Home

            addChild(self.navController1)
            self.navController1.view.frame = self.contrainerView.bounds
            self.contrainerView.addSubview(navController1.view)
            break

        case 2:// Room Controles
            self.navController2.view.frame = self.contrainerView.bounds
            self.contrainerView.addSubview(navController2.view)
            break
        default:
            break
        }

    }
    
}

