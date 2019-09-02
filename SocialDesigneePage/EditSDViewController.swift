//
//  EditSDViewController.swift
//  SocialDesigneePage
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 01/09/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import CloudKit
import CoreLocation

enum EventKey: String {
    case Name
    case Description
    case Location
    case PhotoName
    case DateEvent
    case StartTimeEvent
    case EndTimeEvent
}



extension CKRecord {
    subscript(key: EventKey) -> Any? {
        get {
            return self[key.rawValue]
        }
        
        set {
            self[key.rawValue] = newValue as? CKRecordValue
        }
    }
    
}

extension String {
 
    init?(_ placemark: CLPlacemark) {
        guard let country = placemark.country, let locality = placemark.locality else {
            return nil
        }
        self = "\(locality), \(country)"
    }
    
}

 private var datePicker: UIDatePicker?

class EditSDViewController: UIViewController, UITextViewDelegate {
    
    var currentLocation:CLLocation?
    
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var eventImage: UIImageView!
    
    @IBOutlet weak var eventNameTextField: UITextField!
    
    @IBOutlet weak var eventDescriptionTextField: UITextView!
    
    @IBOutlet weak var eventLocation: UITextField!
    
    
    @IBOutlet weak var eventDate: UITextField!
    
    @IBOutlet weak var eventStartTime: UITextField!
    
    @IBOutlet weak var eventEndTime: UITextField!
    
    @IBOutlet weak var photoUpload: UIImageView!
    //        var record = CKRecord(recordType: "Event")
    
   
    let database = CloudContainer.share.publicDatabase
    var record = CKRecord(recordType: "Event")

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cancelButton.layer.borderColor = #colorLiteral(red: 0.3039953709, green: 0.6345664263, blue: 0.8838434815, alpha: 1)
        cancelButton.layer.borderWidth = 1
        addButton.layer.borderColor = #colorLiteral(red: 0.3039953709, green: 0.6345664263, blue: 0.8838434815, alpha: 1)
        addButton.layer.borderWidth = 1
        
        self.eventDescriptionTextField?.delegate = self
//        record[.Name] = eventNameTextField.text
//        record[.Description] = eventDescriptionTextField.text as NSString
//
//        database?.save(record, completionHandler: { (record, error) in
//            if error != nil {
//                print(error?.localizedDescription)
//            } else {
//                print("records imported")
//            }
//        })
//
//        self.eventDate.delegate = self
//
//        datePicker = UIDatePicker()
//        datePicker?.datePickerMode = .date
//        datePicker?.addTarget(self, action: #selector(EditSDViewController.dateChanged(datePicker:)), for: .valueChanged)
//
//        eventDate.inputView = datePicker
        
        
        
    }
    
    
    
//    @IBAction func eventNameTextFieldAction(_ sender: Any) {
//
//        guard let eventName = eventNameTextField.text else {
//            return
//        }
//        record[.Name] = eventName
//    }

    
//    func eventDescriptionTextFieldAction(_ sender: Any) {
//        guard let newEventDescription = eventDescriptionTextField.text else {
//            return
//        }
//        record[.Description] = newEventDescription
//    }


//    func save(eventNameTextField: String) {
//        let newEvent = CKRecord(recordType: Event)
//    }
    
    
    
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        record[.Name] = eventNameTextField.text
        
//        record[.Description] = eventDescriptionTextField.text
        
        let newEventDescription = eventDescriptionTextField

        if newEventDescription != nil {
            record[.Description] = newEventDescription?.text
        }
////        var newEventDescription = record[.Description]
////        newEventDescription = eventDescriptionTextField.text
        
//        record[.Location] = eventLocation.text
        
//        guard let locationString = eventLocation.text else {return}
//        CLGeocoder().geocodeAddressString(locationString) { placemarks, error in
//            guard let placemark = placemarks?.first, error == nil else {return}
//            self.record[.Location] = placemark.location
//
//            DispatchQueue.main.async {
//                self.eventLocation.text = String(placemark)
//            }
//        }
//
//        record[.Location] = eventLocation.text
        
//        let locationString = eventLocation.text
        
//        guard let locationString2 = locationString else {return}
//        CLGeocoder().geocodeAddressString(locationString2) { (placemarks, error) in
//            guard let placemark = placemarks?.first, error == nil else {return}
        
//            self.record[.Location] = placemark.location
            
//            DispatchQueue.main.async {
//                self.record[.Location] = placemark.location
//                self.eventLocation.text = String(placemark)
//            }
//        }
        
        record[.Location] = currentLocation
        
//        record[.DateEvent] = eventDate.text
        
        let newEventDate = eventDate.text
        
        guard let newestEvenDate = newEventDate else {
            return
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        
        guard let date = formatter.date(from: newestEvenDate) else {return}
        
        record[.DateEvent] = date
        
        let newEventStartTime = eventStartTime.text
        
        guard let newestEventStartTime = newEventStartTime else { return}
        
        var formatterTime = DateFormatter()
        formatterTime.dateFormat = "HH:mm"
        
        guard let time = formatterTime.date(from: newestEventStartTime) else {
            return
        }
        
        record[.StartTimeEvent] = time
        
        let newEventEndTime = eventEndTime.text
        
        guard let newestEventEndTime = newEventEndTime else {return}
        
        var formatterEndTime = DateFormatter()
        formatterEndTime.dateFormat = "HH:mm"
        
        guard let endTime = formatterEndTime.date(from: newestEventEndTime) else {
            return
        }
        
        record[.EndTimeEvent] = endTime
        
        
        
        
    
        
//
        
        CloudContainer.share.publicDatabase.save(record) { (record, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                print("records imported")
            }
        }
        
        
//        CloudContainer.share.publicDatabase.save(record) { [unowned self] _, error in DispatchQueue.main.async {
//            if let error = error {
//                let alert = UIAlertController(title: "Cloudkit Error", message: error.localizedDescription, preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                self.present(alert, animated: true
//                    , completion: nil)
//            }
//            else {
//                self.clear()
//
//            }
//            }
//
//        }
        
//        save(eventNameTextField: eventNameTextField.text!)
//        save(eventDescriptionTextField: eventDescriptionTextField.text!)
//
        
//        database?.save(record) { [unowned self] _, error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    let alert = UIAlertController(title: "Cloudkit Error", message: error.localizedDescription, preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                    self.present(alert, animated: true, completion: nil)
//                }
//                else {
//
//                    self.clear()
//                }
//            }
//        }
//
//    }
////        save(eventNameTextField.text!)
////      save(eventDescriptionTextField)
//
//
//
//
//    private func clear() {
//        eventNameTextField.text = nil
////        eventDescriptionTextField.text = nil
//
//        record = CKRecord(recordType: "Event")
//
//        _ = eventNameTextField.becomeFirstResponder()
//    }

//    func save(_ sender: Any){
//
//        database?.save(record, completionHandler: { [unowned self] _, error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    let alert = UIAlertController(title: "Cloudkit Error", message: error.localizedDescription, preferredStyle: .alert)
//                    alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
//                    self.present(alert, animated: true, completion: nil)
//                }
//
//                else {
//                    self.clear()
//                }
//            }
//        })
//
//
//    }
    
//    func save(eventNameTextField: String){
//        let newEventName = CKRecord(recordType: "Event")
//        newEventName.setValue(eventNameTextField, forKey: "Name")
//        database?.save(newEventName, completionHandler: { (record, error) in
//            guard record != nil else {return}
//            print("success")
//        })
//    }
//
////
//    func save(eventDescriptionTextField: String){
//        let newEventDescription = CKRecord(recordType: "Event")
//        newEventDescription.setValue(eventDescriptionTextField, forKey: "Description")
//        database?.save(newEventDescription, completionHandler: { (record, error) in
//            guard record != nil else {return}
//            print("another success")
//        })
//    }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
//        guard let newEventDescription = eventDescriptionTextField.text else {
//            return
//        }
//        record[.Description] = newEventDescription
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        eventDate.text = dateFormatter.string(from: datePicker.date)
        record[.DateEvent] = eventDate.text
        view.endEditing(true)
    }

    @IBAction func checkLocation(_ sender: Any) {
        let locationString = eventLocation.text
        guard let locationString2 = locationString else {return}
        CLGeocoder().geocodeAddressString(locationString2) { (placemarks, error) in
            guard let placemark = placemarks?.first, error == nil else {return}
            
            //            self.record[.Location] = placemark.location
            self.currentLocation = placemark.location
            DispatchQueue.main.async {
//                self.currentLocation = placemark.location
                self.eventLocation.text = String(placemark)
            }
        }
    }
}



//extension EditSDViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 0
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//    }
//
//}
