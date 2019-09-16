//
//  EditSDViewController.swift
//  SocialDesigneePage
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 01/09/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import CloudKit
//import CoreLocation
import Photos

enum EventKey: String {
    case Name
    case Description
    case Location
    case DateEvent
    case StartTimeEvent
    case EndTimeEvent
    case Photo
    case PhotoName
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

//extension String {
//
//    init?(_ placemark: CLPlacemark) {
//        guard let country = placemark.country, let locality = placemark.locality else {
//            return nil
//        }
//        self = "\(locality), \(country)"
//    }
//
//}

// private var datePicker: UIDatePicker?





class EditSDViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    
//    @IBOutlet weak var txtBC: NSLayoutConstraint!
    //    var tapGesture = UITapGestureRecognizer()
    
    var photoURL: URL?
//    var currentLocation:CLLocation?
    
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var eventImage: UIImageView!
    
    @IBOutlet weak var eventNameTextField: UITextField!
    
    @IBOutlet weak var eventDescriptionTextField: UITextView!
    
    @IBOutlet weak var eventLocation: UITextField!
    
    @IBOutlet weak var editScrollView: UIScrollView!
    
    @IBOutlet weak var eventDate: UITextField!
    
    @IBOutlet weak var eventStartTime: UITextField!
    
    @IBOutlet weak var eventEndTime: UITextField!
    
    @IBOutlet weak var viewWait: UIView!
    
    //        var record = CKRecord(recordType: "Event")
    
    let database = CloudContainer.share.publicDatabase
    var record = CKRecord(recordType: "Event")
    
    var newPhotoName: String = ""
    
    var newRecord:CKRecord?

    override func viewDidLoad() {
        super.viewDidLoad()

//        viewWait.isHidden = true
        // Do any additional setup after loading the view.
        
        cancelButton.layer.borderColor = #colorLiteral(red: 0.3039953709, green: 0.6345664263, blue: 0.8838434815, alpha: 1)
        cancelButton.layer.borderWidth = 1
        addButton.layer.borderColor = #colorLiteral(red: 0.3039953709, green: 0.6345664263, blue: 0.8838434815, alpha: 1)
        addButton.layer.borderWidth = 1
        
        self.eventDescriptionTextField?.delegate = self
        
//        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
//        tapGesture.numberOfTapsRequired = 1
//        tapGesture.numberOfTouchesRequired = 1
//        eventImage.addGestureRecognizer
        eventImage.isUserInteractionEnabled = true
        eventImage.isMultipleTouchEnabled = true

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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        eventEndTime.delegate = self
        eventStartTime.delegate = self
        eventDate.delegate = self
        eventLocation.delegate = self
        eventDescriptionTextField.delegate = self
        
    }
    
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    
////    @objc func keyBoardWillShow(notification: Notification){
//        if let userInfo = notification.userInfo as? Dictionary<String, AnyObject>{
//            let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey]
//            let keyBoardRect = frame?.cgRectValue
//            if let keyBoardHeight = keyBoardRect?.height {
////                self.txtBC.constant = keyBoardHeight
////                self.view.layer.frame = CGRect(x: 0, y: 0, width: 0, height: keyBoardHeight)
//
//                UIView.animate(withDuration: 0.5, animations: {
//                    self.view.layoutIfNeeded()
//                })
//            }
//        }
//    }
//
//    @objc func keyBoardWillHide(notification: Notification){
//
////        self.txtBC.constant = 60.0
////        self.view.layer.frame = CGRect(x: 0, y: 0, width: 0, height: 60.0)
//        UIView.animate(withDuration: 0.5, animations: {
//            self.view.layoutIfNeeded()
//        })
//    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object:  nil)
    }
    
    override  func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        eventNameTextField.endEditing(true)
        eventDescriptionTextField.endEditing(true)
        eventLocation.endEditing(true)
        eventDate.endEditing(true)
        eventStartTime.endEditing(true)
        eventEndTime.endEditing(true)
    }
    
    @IBAction func uploadPhotoTapped(_ sender: UITapGestureRecognizer) {
        
          let location = sender.location(in: eventImage)
            
            let imagePicker = UIImagePickerController()

            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
          //  image.mediaTypes = [ kCIAttributeTypeImage as String]
            self.present(imagePicker, animated: true, completion: nil)
        
        
        
    }
    
    func hideKeyboard() {
        eventNameTextField.resignFirstResponder()
        eventDate.resignFirstResponder()
        eventEndTime.resignFirstResponder()
        eventLocation.resignFirstResponder()
        eventStartTime.resignFirstResponder()
        eventDescriptionTextField.resignFirstResponder()
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        
       view.frame.origin.y = -200
    
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            
            view.frame.origin.y = 0

        }
        
//        if keyboardScreenEndFrame > eventDate.frame.origin.y {
//            view.frame.origin.y = -100
//        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
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
        
        hideKeyboard()
        
        activityIndicator("Please Wait...")
//        viewWait.isHidden = false
//        view.bringSubviewToFront(viewWait)
////        navigationController?.setNavigationBarHidden(true, animated: true)
//
        record[.Name] = eventNameTextField.text
        
//        record[.Description] = eventDescriptionTextField.text
        
        guard let newEventDescription = eventDescriptionTextField else {return}

        if newEventDescription != nil {
            record[.Description] = newEventDescription.text
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
        
        record[.Location] = eventLocation.text
        
//        record[.DateEvent] = eventDate.text
        
        let newEventDate = eventDate.text
        
        guard let newestEvenDate = newEventDate else {
            return
        }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "dd-MM-yyyy"
        
        guard let date = formatter.date(from: newestEvenDate) else {return}

        record[.DateEvent] = date
        
        let newEventStartTime = eventStartTime.text

        guard let newestEventStartTime = newEventStartTime else { return}

        let formatterTime = DateFormatter()
        formatterTime.dateFormat = "HH:mm"

        guard let time = formatterTime.date(from: newestEventStartTime) else {
            return
        }
        
        record[.StartTimeEvent] = time

        let newEventEndTime = eventEndTime.text

        guard let newestEventEndTime = newEventEndTime else {return}

        let formatterEndTime = DateFormatter()
        formatterEndTime.dateFormat = "HH:mm"
        
        guard let endTime = formatterEndTime.date(from: newestEventEndTime) else {
            return
        }
        
        record[.EndTimeEvent] = endTime
        
        record[.PhotoName] = newPhotoName as NSString
        
//        if let imageURL = Bundle.main.url(forResource: newPhotoName, withExtension: "jpeg") {
        
        let asset = CKAsset(fileURL: self.photoURL!)
            record[.Photo] = asset
//        }
        
        
        
       
         
//
        
        CloudContainer.share.publicDatabase.save(record) { (record, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                
                print("records imported")
                self.newRecord = record
                DispatchQueue.main.async {
                    
                     self.performSegue(withIdentifier: "listEventSegue", sender: nil)
//                                    self.viewWait.isHidden = true
                                    self.effectView.removeFromSuperview()
                    
                

                }
               
            }
            
//            OperationQueue.main.addOperation({ () -> Void in
//                self.navigationController?.setNavigationBarHidden(false, animated: true)
//            })
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
    
//    func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "listEventSEgue" {
//            let eventDetailCommunityController = segue.destination as! EventDetailCommunityController
//            
//        }
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
//    @objc func dateChanged(datePicker: UIDatePicker) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        eventDate.text = dateFormatter.string(from: datePicker.date)
//        record[.DateEvent] = eventDate.text
//        view.endEditing(true)
//    }

//    @IBAction func checkLocation(_ sender: Any) {
//        let locationString = eventLocation.text
//        guard let locationString2 = locationString else {return}
//        CLGeocoder().geocodeAddressString(locationString2) { (placemarks, error) in
//            guard let placemark = placemarks?.first, error == nil else {return}
//
//            //            self.record[.Location] = placemark.location
//            self.currentLocation = placemark.location
//            DispatchQueue.main.async {
////                self.currentLocation = placemark.location
//                self.eventLocation.text = String(placemark)
//            }
//        }
//    }
//
    
//    @objc func handleTap(_ sender: UITapGestureRecognizer) {
//
//        let image = UIImagePickerController()
//
//        image.delegate = self
//        image.sourceType = UIImagePickerController.SourceType.photoLibrary
//        self.present(image, animated: true, completion: nil)
//
//
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        eventImage.backgroundColor = UIColor.clear
        eventImage.image = image
        
        if let imageUrl = info[.imageURL] as? URL {
            newPhotoName = imageUrl.lastPathComponent
        }

        
        photoURL = saveImageToFile(image)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveImageToFile(_ image: UIImage) -> URL {
        
        let fileMgr = FileManager.default
        
        let dirPaths = fileMgr.urls(for: .documentDirectory, in: .allDomainsMask)
        
        let fileURL = dirPaths[0].appendingPathComponent("feast")
        
        if let renderedJpegData = image.jpegData(compressionQuality: 0.5) {
            
            try! renderedJpegData.write(to: fileURL)
        }
        
//        if let renderedPngData = image.pngData() {
//            try! renderedPngData.write(to: fileURL)
//        }
        
        return fileURL
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! EventDetailCommunityController
        controller.record = newRecord
    }
    
    let messageFrame = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    func activityIndicator(_ title: String) {
        
        strLabel.removeFromSuperview()
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 46))
        strLabel.text = title
        strLabel.font = .systemFont(ofSize: 14, weight: .medium)
        strLabel.textColor = UIColor(white: 0.9, alpha: 0.7)
        
        effectView.frame = CGRect(x: view.frame.midX - strLabel.frame.width/2, y: view.frame.midY - strLabel.frame.height/2 , width: 160, height: 46)
        effectView.layer.cornerRadius = 20
        effectView.layer.masksToBounds = true
        
        activityIndicator = UIActivityIndicatorView(style: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.startAnimating()
        
        effectView.contentView.addSubview(activityIndicator)
        effectView.contentView.addSubview(strLabel)
        view.addSubview(effectView)
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
