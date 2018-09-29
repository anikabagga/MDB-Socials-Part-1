//
//  NewSocialViewController.swift
//  MDBSocialsPart1
//
//  Created by Anika Bagga on 9/25/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import UIKit

class NewSocialViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var enterName: UITextField!
    var enterDetails: UITextField!
    
    var takePic: UIButton!
    var selectPic: UIButton!
    var myImageView: UIImageView!
    var selectedImage: UIImage!
    
    var addButton: UIButton!
    var cancelButton: UIButton!
    
    var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "New Event"
        self.navigationController?.navigationBar.tintColor = .black
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        addButton.setTitle("Add Event", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.addTarget(self, action: #selector(addEventButtonPressed), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        
        cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelButton)
        
        
        enterName = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 60.00));
        enterName.center = CGPoint(x: view.frame.width / 2, y:  130)
        enterName.placeholder = " Event Name "
        enterName.borderStyle = UITextBorderStyle.roundedRect
        enterName.keyboardType = UIKeyboardType.default
        enterName.textColor = UIColor.black
        self.view.addSubview(enterName)
        
        enterDetails = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 100.00));
        enterDetails.center = CGPoint(x: view.frame.width / 2, y: 220)
        enterDetails.placeholder = " Event Description "
        enterDetails.borderStyle = UITextBorderStyle.roundedRect
        enterDetails.keyboardType = UIKeyboardType.default
        enterDetails.textColor = UIColor.black
        self.view.addSubview(enterDetails)
        

        selectPic = UIButton(frame: CGRect(x: 0 , y: 0, width:  view.frame.width * 0.4, height: 50))
        selectPic.center = CGPoint(x: view.frame.width / 2 + 90, y:  view.frame.height/2 )
        selectPic.setTitle("Select Image", for: .normal)
        selectPic.layer.cornerRadius = 20
        selectPic.backgroundColor = .blue
        selectPic.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        view.addSubview(selectPic)
        
        takePic = UIButton(frame: CGRect(x: 0 , y: 0, width: view.frame.width * 0.4 , height: 50))
        takePic.center = CGPoint(x: view.frame.width / 2 + 90, y:  view.frame.height/2 + 100)
        takePic.setTitle("Take Image", for: .normal)
        takePic.layer.cornerRadius = 20
        takePic.backgroundColor = .blue
        //takePic.addTarget(self, action: #selector(importImage), for: .touchUpInside)
        view.addSubview(takePic)
        
        let imageName = "img-placeholder"
        let image = UIImage(named: imageName)
        myImageView = UIImageView(image: image!)
        myImageView.frame = CGRect(x: 0, y: 0, width: 170, height: 180)
        myImageView.center = CGPoint(x: 100, y: view.frame.height/2 + 50)
        view.addSubview(myImageView)
        
        datePicker = UIDatePicker(frame: CGRect(x: 0, y: view.frame.height/2 + 150, width: view.frame.width, height: 200))
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        datePicker.addTarget(self, action: #selector(NewSocialViewController.datePickerValueChanged(_:)), for: .valueChanged)
        view.addSubview(datePicker)
    }

    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        // Create date formatter
        let dateFormatter: DateFormatter = DateFormatter()
        // Set date format
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        print("Selected value \(selectedDate)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func importImage(_ sender: AnyObject){
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    @objc func selectImage(_ sender: AnyObject){
        let img = UIImagePickerController()
        img.sourceType = .camera
        img.allowsEditing = false
        img.delegate = self
        present(img, animated: true)
    }
    
    @objc func addEventButtonPressed(){
        if enterName.hasText && enterDetails.hasText && selectedImage != nil {
            FirebaseHelper.newPostWithImage(selectedImage: selectedImage, name: enterName.text!, description: enterDetails.text!, date: datePicker.date){
                self.dismiss(animated: true, completion: {
                    print("Post Complete")
                })
            }
        }else{
            let alertController = UIAlertController(title: "Fields Blank", message:
                "Please enter all required information.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    @objc func cancelButtonPressed(){
        performSegue(withIdentifier: "backToFeedSegue", sender: self)
    }
            
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myImageView.image = selectedImage
        }else{
            print("could not convert image")
        }
            dismiss(animated:true, completion: nil)
        }
    }
            
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//    }


