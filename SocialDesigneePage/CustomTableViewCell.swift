//
//  CustomTableViewCell.swift
//  SocialDesigneePage
//
//  Created by Benjamin Purbowasito on 28/08/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet var photoImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    
    @IBOutlet var sendButt: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
