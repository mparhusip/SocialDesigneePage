//
//  roundShape.swift
//  detailKegiatanSD
//
//  Created by Benjamin Purbowasito on 27/08/19.
//  Copyright © 2019 iosda. All rights reserved.
//

import Foundation
import UIKit

class roundShape: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            
        }
    }
}
