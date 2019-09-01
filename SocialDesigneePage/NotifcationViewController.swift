//
//  NotifcationViewController.swift
//  SocialDesigneePage
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 28/08/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class NotifcationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var imagesNotification: [notification] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func showDetailNotif(_ sender: Any) {
        animateScaleIn(desiredView: blurNotifView)
        animateScaleIn(desiredView: popUpNotifView)
    }
    
    @IBAction func cancelNotifButton(_ sender: Any) {
        animateScaleOut(desiredView: popUpNotifView)
        animateScaleOut(desiredView: blurNotifView)
    }
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var popUpNotifView: UIView!
    @IBOutlet var blurNotifView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        blurNotifView.bounds = self.view.bounds
        popUpNotifView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width*0.9, height: self.view.bounds.height*0.4)
        popUpNotifView.layer.cornerRadius = 5
        
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        
        imagesNotification = createArray()
        
        
    }
    
    
    
    func createArray() -> [notification] {
        
        var tempImagesNotification: [notification] = []
        
        let imagesNotification1 = notification(image: #imageLiteral(resourceName: "iconUser"), message: "Benny send you an event invitation")
        let imagesNotification2 = notification(image: #imageLiteral(resourceName: "iconUser"), message: "Edvyn accepts your invitation")
        let imagesNotification3 = notification(image: #imageLiteral(resourceName: "iconUser"), message: "Monica decline your invitation")
        let imagesNotification4 = notification(image: #imageLiteral(resourceName: "iconUser"), message: "Daniel accept your friend request")
        let imagesNotification5 = notification(image: #imageLiteral(resourceName: "iconUser"), message: "Mary accept your friend request")
        
        tempImagesNotification.append(imagesNotification1)
        tempImagesNotification.append(imagesNotification2)
        tempImagesNotification.append(imagesNotification3)
        tempImagesNotification.append(imagesNotification4)
        tempImagesNotification.append(imagesNotification5)
        
        return tempImagesNotification
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesNotification.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageNotification = imagesNotification[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotifCell") as! NotifCell
        
        cell.setNotification(imageNotification: imageNotification)
        
        cell.detailNotifButt.tag = indexPath.row
        cell.detailNotifButt.addTarget(self, action: #selector(rowButtonWasTapped(sender:)), for: .touchUpInside)
        
        
        return cell
        
    }
    
    @objc
    func rowButtonWasTapped(sender:UIButton){
        let rowIndex:Int = sender.tag
        print(rowIndex)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Today"
        case 1: return "Yesterday"
        case 2: return "This Week"
        case 3: return "Last Week"
        default: return nil
        }
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

//extension NotifcationViewController: UITableViewDelegate, UITableViewDataSource{
//
    //@IBOutlet var notifTableView: UITableView!

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return imagesNotification.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let imageNotification = imagesNotification[indexPath.row]
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "NotifCell") as! NotifCell
//
//        cell.setNotification(imageNotification: imageNotification)
//
//        return cell
//
//
//    }
//
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0: return "Today"
//        case 1: return "Yesterday"
//        case 2: return "This Week"
//        case 3: return "Last Week"
//        default: return nil
//        }
//    }
//

