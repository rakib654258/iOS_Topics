//
//  ViewController.swift
//  AppIconBadgeNumber
//
//  Created by RakiB on 25/2/20.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var badgeNumber: Int = 29
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appIconBadgeSet()
    }
    func appIconBadgeSet(){
        let application = UIApplication.shared
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge,.alert,.sound]) { (response, error) in
            print(response)
        }
        application.applicationIconBadgeNumber = badgeNumber
        application.registerForRemoteNotifications()
    }

}

