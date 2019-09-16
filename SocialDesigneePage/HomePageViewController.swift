//
//  HomePageViewController.swift
//  SocialDesigneePage
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 05/09/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import CloudKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var eventTableViewHomePage: UITableView!
    
    var homePageEvents: Array<CKRecord> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTableViewHomePage.delegate = self
        eventTableViewHomePage.dataSource = self
        fetchHomepageEvents { (finished) in
            if finished{
                DispatchQueue.main.async {
                    self.eventTableViewHomePage.reloadData()
                }
                
            }
        }
        
       
        
    
    }
    
    func fetchHomepageEvents(completionHandler: @escaping(_ finished:Bool)-> Void){
        let container = CloudContainer.share.publicDatabase
        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: "Event", predicate: predicate)
        let queryOperation = CKQueryOperation(query: query)
        
        queryOperation.resultsLimit = 5
        
        queryOperation.recordFetchedBlock = { record in
            self.homePageEvents.append(record)
            print(record)
            
        }
        
        queryOperation.queryCompletionBlock = { cursor, error in
            if error != nil {
                print(error?.localizedDescription)
                completionHandler(false)
            } else {
                completionHandler(true)
            }
        }
        
        CloudContainer.share.publicDatabase.add(queryOperation)
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

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return homePageEvents.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomePageTableViewCell
//        cell.imageView.image =
        let event = homePageEvents[indexPath.row]
        cell.eventOnGoingNameLabelHomePage.text = event.value(forKey: "Name") as! String
        
        let eventDateHome = event.value(forKey: "DateEvent") as! NSDate
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let nowDateHomepage = dateFormatter.string(from: eventDateHome as Date)
        cell.eventOnGoingDateLabelHomePage.text = nowDateHomepage
        
        cell.eventOnGoingIndicatorHomePage.text = "On-Progress"
        
//        cell.eventOnGoingImageViewHomePage.image = UIImage(named: "feast")
        
    
//        let imageAssetHomepage: CKAsset = event.value(forKey: "Photo") as! CKAsset
        
//        if let asset = event.value(forKey: "Photo") as? CKAsset, let data = try? Data(contentsOf: asset.fileURL!)
//        {
//            cell.eventOnGoingImageViewHomePage.image = UIImage(data: data)
//        }
        
//        cell.eventOnGoingImageViewHomePage.image = UIImage(contentsOfFile: imageAssetHomepage.fileURL!.path)
//        cell.eventOnGoingImageViewHomePage.contentMode = UIImageView.ContentMode.scaleAspectFill
        
        return cell
//        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "On-Going Events"
        } else {
            return "Finished Events"
        }
}

}

