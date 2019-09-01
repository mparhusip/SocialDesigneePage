//
//  roundShapeCorner.swift
//  SocialDesigneePage
//
//  Created by Benjamin Purbowasito on 28/08/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import Foundation
import UIKit

class roundedCornerView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
}

