//
//  customTableViewCell.swift
//  DynamicCellHeight
//
//  Created by macOS Mojave on 5/3/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet weak var myLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
