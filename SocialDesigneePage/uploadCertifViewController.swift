//
//  uploadCertifViewController.swift
//  SocialDesigneePage
//
//  Created by Benjamin Purbowasito on 28/08/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class uploadCertifViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var voListTableView: UITableView!
    
    @IBAction func sendCertifAction(_ sender: Any) {
        animateScaleIn(desiredView: blurView)
        animateScaleIn(desiredView: popUpView)
    }
    
    @IBAction func cancelCertifAction(_ sender: Any) {
        animateScaleOut(desiredView: popUpView)
        animateScaleOut(desiredView: blurView)
    }
    
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popUpView: UIView!
    @IBOutlet var sendCertifButt: UIButton!
    @IBOutlet var cancelCertificationButt: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        blurView.bounds = self.view.bounds
        popUpView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width*0.9, height: self.view.bounds.height*0.4)
        popUpView.layer.cornerRadius = 5
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        
        cell.sendButt.tag = indexPath.row
        cell.sendButt.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc
    func rowButtonWasTapped(sender:UIButton){
        let rowIndex:Int = sender.tag
        print(rowIndex)
        
    }
    
    func animateScaleIn(desiredView: UIView) {
        let backgroundView = self.view!
        backgroundView.addSubview(desiredView)
        desiredView.center = backgroundView.center
        desiredView.isHidden = false
        
        desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        desiredView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
            //            desiredView.transform = CGAffineTransform.identity
        }
    }
    
    /// Animates a view to scale out remove from the display
    func animateScaleOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.2, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            desiredView.alpha = 0
        }, completion: { (success: Bool) in
            desiredView.removeFromSuperview()
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            
        }, completion: { _ in
            
        })
    }
}

