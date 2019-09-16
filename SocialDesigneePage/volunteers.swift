//
//  volunteers.swift
//  SocialDesigneePage
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 27/08/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import Foundation
import UIKit
import CloudKit


class volunteers {
    
    var image: UIImage
    var nama: String
    var status: String
    
    init(image: UIImage, nama: String, status: String) {
        self.image = image
        self.nama = nama
        self.status = status
    }
}
