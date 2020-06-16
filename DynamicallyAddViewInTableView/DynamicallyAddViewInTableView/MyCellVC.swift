//
//  MyCellVC.swift
//  DynamicallyAddViewInTableView
//
//  Created by RakiB on 11/6/20.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

class MyCellVC: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
