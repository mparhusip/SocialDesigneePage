//
//  EventDetailCommunityController.swift
//  SocialDesigneePage
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 27/08/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class EventDetailCommunityController: UIViewController {
    
    var imagesVolunteers: [volunteers] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagesVolunteers = createArray()
        
    }
    
    func createArray() -> [volunteers] {
        
        var tempImagesVolunteers: [volunteers] = []
        
        let imagesVolunteers1 = volunteers(image: #imageLiteral(resourceName: "icons8-male-user-50"), nama: "Nama", status: "Status")
        let imagesVolunteers2 = volunteers(image: #imageLiteral(resourceName: "icons8-male-user-50"), nama: "Nama", status: "Status")
        let imagesVolunteers3 = volunteers(image: #imageLiteral(resourceName: "icons8-male-user-50"), nama: "Nama", status: "Status")
        let imagesVolunteers4 = volunteers(image: #imageLiteral(resourceName: "icons8-male-user-50"), nama: "Nama", status: "Status")
        
        tempImagesVolunteers.append(imagesVolunteers1)
        tempImagesVolunteers.append(imagesVolunteers2)
        tempImagesVolunteers.append(imagesVolunteers3)
        tempImagesVolunteers.append(imagesVolunteers4)
        
        return tempImagesVolunteers
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

extension EventDetailCommunityController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesVolunteers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageVolunteer = imagesVolunteers[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VolunteersCell") as! VolunteersCell
        
        cell.setVolunteers(imageVolunteer: imageVolunteer)
        
        return cell
    }
    
    
    
}
