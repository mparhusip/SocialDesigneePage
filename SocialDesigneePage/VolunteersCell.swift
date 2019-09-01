//
//  VolunteersCell.swift
//  SocialDesigneePage
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 27/08/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class VolunteersCell: UITableViewCell {
    
    
    @IBOutlet weak var volunteerImageView: UIImageView!
    
    @IBOutlet weak var volunteerNameLabel: UILabel!
    
    @IBOutlet weak var volunteerStatusButton: UIButton!
    
    func setVolunteers(imageVolunteer: volunteers) {
        volunteerImageView.image = imageVolunteer.image
        volunteerNameLabel.text = imageVolunteer.nama
        volunteerStatusButton.titleLabel?.text = imageVolunteer.status
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
