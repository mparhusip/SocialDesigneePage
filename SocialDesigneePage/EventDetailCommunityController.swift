//
//  EventDetailCommunityController.swift
//  SocialDesigneePage
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 27/08/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import CloudKit
import CoreLocation



class EventDetailCommunityController: UIViewController {
    
    @IBOutlet weak var listEventImage: UIImageView!
    
    @IBOutlet weak var listEventName: UILabel!
    
    @IBOutlet weak var listEventDescription: UITextView!
    
    @IBOutlet weak var listEventLocation: UILabel!
    
    @IBOutlet weak var listEventTime: UILabel!
    
    @IBOutlet weak var listEventDate: UILabel!
    
    
    var imagesVolunteers: [volunteers] = []
    var arrEvents: Array<CKRecord> = []
    
//    var record: CKRecord?
    
//    var listName: String?
//    var listDescription: String?
//    var listLocation: CLLocation?
//    var listDate: Date?
//    var listStartTime: Date?
//    var listEndTime: Date?
//    var listImage: CKAsset?
    var record:CKRecord?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        listEventDescription.allowsEditingTextAttributes = false
        
        self.listEventName.text = record!.value(forKey: "Name") as! String
        self.listEventDescription.text = record!.value(forKey: "Description") as! String
        self.listEventLocation.text = record!.value(forKey: "Location") as! String
        

        let eventDate = record!.value(forKey: "DateEvent") as! NSDate
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let nowDate = dateFormatter.string(from: eventDate as Date)
        self.listEventDate.text = nowDate
       
        
        let startTime = record!.value(forKey: "StartTimeEvent") as! NSDate
        let endTime = record!.value(forKey: "EndTimeEvent") as! NSDate
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .long
        timeFormatter.dateFormat = "HH:mm"
        let nowStartTime = timeFormatter.string(from: startTime as Date)
        let endNowTime = timeFormatter.string(from: endTime as Date)
        self.listEventTime.text = nowStartTime + " - " + endNowTime
        
        let imageAsset: CKAsset = record!.value(forKey: "Photo") as! CKAsset
        self.listEventImage.image = UIImage(contentsOfFile: imageAsset.fileURL!.path)
        self.listEventImage.contentMode = UIView.ContentMode.scaleAspectFill
        
        
       
        
//        let geocoder = CLGeocoder()
//        geocoder.reverseGeocodeLocation(locationObj) { (placemarks, error) in
//            if let placemark = placemarks?.first,
//            let subThoroughfare = placemark.subThoroughfare,
//            let thoroughfare = placemark.thoroughfare,
//            let locality = placemark.locality,
//                let administrativeArea = placemark.administrativeArea {
//                let address = subThoroughfare + "" + thoroughfare + "," + locality + "" + administrativeArea
//
//                placemark.locality
//
//                return completion(address)
//            }
//        }
//
//        getAddresFrom(locationObj: l)
//
//        self.listEventLocation.text = "\(coord)"
        
//        self.listEventLocation.text = record!.value(forKey: "Location") as! String
//        self.listEventDate.text = record!.value(forKey: "DateEvent") as! String
//        self.listEventTime.text = record!.value(forKey: "StartTimeEvent") as! String; "-"; record!.value(forKey: "EndTimeEvent") as! String
//        self.listEventImage.image = record!.value(forKey: "Photo") as! UIImage
        
        
        
//        let predicate = NSPredicate(value: true)
//        let query = CKQuery(recordType: "Event", predicate: predicate)
        
        
//        CloudContainer.share.publicDatabase.perform(query, inZoneWith: nil) { (results, error) in
//            if error != nil {
//                print(error)
//            } else {
//                print(results)
//                DispatchQueue.main.async {
//                    self.listEventName.text = results![results!.endIndex-1].value(forKey: "Name") as! String
//
//                }
//
//
////                for result in results! {
////                    self.arrEvents.append(result as! CKRecord)
////                }
////
////                OperationQueue.main.addOperation({
////
////
////                })
//            }
//        }
        
    
//        let predicate = NSPredicate(value: true)
//        let query = CKQuery(recordType: "Event", predicate: predicate)
//
//        CloudContainer.share.publicDatabase.perform(query, inZoneWith: nil) { (record, error) in
//            if error == nil {
//                for rec in record[0] {
//                    let record: CKRecord = rec as! CKRecord
//
//        }
//
//
//
//                }
//            }
//
//            for record: CKRecord in record! {
//                self.listName = record.value(forKey: "Name") as! String
//                self.listDescription = record.value(forKey: "Description") as! String
//                self.listLocation = record.value(forKey: "Location") as! CLLocation
//                self.listDate = record.value(forKey: "DateEvent") as! Date
//                self.listStartTime = record.value(forKey: "StartTimeEvent") as! Date
//                self.listEndTime = record.value(forKey: "EndTimeEvent") as! Date
//                self.listImage = record.value(forKey: "Photo") as! CKAsset
//
//            }
    
//        }

//        listEventName.text = listName
//        print(listName)
//        listEventDescription.text = listDescription
//
    
        
        
        
        
        
        imagesVolunteers = createArray()
        
    }
    
    func createArray() -> [volunteers] {
        
        var tempImagesVolunteers: [volunteers] = []
        
        let imagesVolunteers1 = volunteers(image: #imageLiteral(resourceName: "undraw_male_avatar_323b"), nama: "Trevin", status: "Registeres")
        let imagesVolunteers2 = volunteers(image: #imageLiteral(resourceName: "undraw_male_avatar_323b"), nama: "Pramahadi", status: "Registered")
        let imagesVolunteers3 = volunteers(image: #imageLiteral(resourceName: "undraw_female_avatar_l3ey"), nama: "Monica", status: "Registered")
        let imagesVolunteers4 = volunteers(image: #imageLiteral(resourceName: "undraw_male_avatar_323b"), nama: "Benjamin", status: "Registered")
        
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
