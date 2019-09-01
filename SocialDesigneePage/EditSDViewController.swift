//
//  EditSDViewController.swift
//  SocialDesigneePage
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 01/09/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class EditSDViewController: UIViewController {
    
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var eventImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cancelButton.layer.borderColor = #colorLiteral(red: 0.3039953709, green: 0.6345664263, blue: 0.8838434815, alpha: 1)
        cancelButton.layer.borderWidth = 1
        addButton.layer.borderColor = #colorLiteral(red: 0.3039953709, green: 0.6345664263, blue: 0.8838434815, alpha: 1)
        addButton.layer.borderWidth = 1
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
