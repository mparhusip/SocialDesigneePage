//
//  HomePageTableViewCellDone.swift
//  Social Designee Home Page
//
//  Created by Silamitra Edvyn Tanu on 04/09/19.
//  Copyright © 2019 Silamitra Edvyn Tanu. All rights reserved.
//

import UIKit

class HomePageTableViewCellDone: UITableViewCell {

    @IBOutlet weak var eventDoneImageViewHomePage: UIImageView!
    @IBOutlet weak var eventDoneNameLabelHomePage: UILabel!
    @IBOutlet weak var eventDoneDateLabelHomePage: UILabel!
    @IBOutlet weak var eventDoneVolunteerLabelHomePage: UILabel!
    @IBOutlet weak var eventDoneIndicatorHomePage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
