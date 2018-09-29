//
//  ViewController.swift
//  MDBSocialsPart1
//
//  Created by Anika Bagga on 9/25/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    var email: UITextField!
    var password: UITextField!
    var login: UIButton!
    var signup: UIButton!
    
    var logoImg: UIImage!
    var mdbLabel: UILabel!
    var socialsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageName = "MDBLogo"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        imageView.center = CGPoint(x: 100, y:  view.frame.height/2 - 150)
        view.addSubview(imageView)
        
        let blueColor = UIColor(red: 119/255.0, green: 139/255.0, blue: 235/255.0, alpha: 1.0)
        self.view.backgroundColor = blueColor
        
        
        mdbLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        mdbLabel.center = CGPoint(x: 200, y: view.frame.height/2 - 150)
        mdbLabel.textAlignment = .center
        mdbLabel.adjustsFontSizeToFitWidth = true
        mdbLabel.text = "MDB"
        self.view.addSubview(mdbLabel)
        
        socialsLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        socialsLabel.center = CGPoint(x: 200, y: view.frame.height/2 - 50)
        socialsLabel.textAlignment = .center
        socialsLabel.adjustsFontSizeToFitWidth = true
        socialsLabel.text = "Socials"
        self.view.addSubview(socialsLabel)
        
        
        //USERNAME UI TEXTFIELD
        email = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        email.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2)
        email.placeholder = " Email "
        email.borderStyle = UITextBorderStyle.roundedRect
        email.keyboardType = UIKeyboardType.default
        email.textColor = UIColor.black
        self.view.addSubview(email)
        
        //PASSWORD UITEXTFIELD
        password = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        password.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2 + 60)
        password.placeholder = " Password "
        password.borderStyle = UITextBorderStyle.roundedRect
        password.keyboardType = UIKeyboardType.default
        password.isSecureTextEntry = true
        password.textColor = UIColor.black
        self.view.addSubview(password)
        
        //LOGIN UIBUTTON
        login = UIButton(frame: CGRect(x: 0 , y: 0, width:  (view.frame.width / 2) - 4, height: 50))
        login.center = CGPoint(x: view.frame.width / 4, y:  view.frame.height/2 + 120)
        login.setTitle("LOGIN", for: .normal)
        login.layer.cornerRadius = 20
        login.backgroundColor = .blue
        login.addTarget(self, action: #selector(loginClicked), for: .touchUpInside)
        view.addSubview(login)
        
        //SINGUP BUTTON
        signup = UIButton(frame: CGRect(x: 0 , y: 0, width:  (view.frame.width / 2) - 4, height: 50))
        signup.center = CGPoint(x: view.frame.width / 4 * 3, y:  view.frame.height/2 + 120)
        signup.setTitle("Sign Up", for: .normal)
        signup.layer.cornerRadius = 20
        signup.backgroundColor = .blue
        signup.addTarget(self, action: #selector(signUpClicked), for: .touchUpInside)
        view.addSubview(signup)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func signUpClicked() {
        performSegue(withIdentifier: "loginToSignUp", sender: self)
        
     //   if let mvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeedViewController") as? ModalViewController {
    //        self.present(mvc, animated: true, completion: nil)
     //   }
        
    }
    
    @objc func loginClicked(_ sender: Any){
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error != nil{
                print(error!)
            }else{
                print("Regestration Succesful")
                self.performSegue(withIdentifier: "toFeed", sender: self)
            }
        }
    }
    

}

