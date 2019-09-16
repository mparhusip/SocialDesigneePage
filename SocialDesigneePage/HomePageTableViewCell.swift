//
//  HomePageTableViewCell.swift
//  Social Designee Home Page
//
//  Created by Silamitra Edvyn Tanu on 04/09/19.
//  Copyright © 2019 Silamitra Edvyn Tanu. All rights reserved.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {

    @IBOutlet weak var eventOnGoingImageViewHomePage: UIImageView!
    @IBOutlet weak var eventOnGoingNameLabelHomePage: UILabel!
    @IBOutlet weak var eventOnGoingDateLabelHomePage: UILabel!
    @IBOutlet weak var eventOnGoingVolunteerLabelHomePage: UILabel!
    @IBOutlet weak var eventOnGoingIndicatorHomePage: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
