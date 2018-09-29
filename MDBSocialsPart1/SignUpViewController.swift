//
//  SignUpViewController.swift
//  MDBSocialsPart1
//
//  Created by Anika Bagga on 9/25/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    var fullName: UITextField!
    var username: UITextField!
    var email: UITextField!
    var password: UITextField!
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let blueColor = UIColor(red: 119/255.0, green: 139/255.0, blue: 235/255.0, alpha: 1.0)
        self.view.backgroundColor = blueColor
        
        //USERNAME UI TEXTFIELD
        fullName = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        fullName.center = CGPoint(x: view.frame.width / 2 , y:  view.frame.height/2 - 80)
        fullName.placeholder = " Full Name "
        fullName.borderStyle = UITextBorderStyle.roundedRect
        fullName.keyboardType = UIKeyboardType.default
        fullName.textColor = UIColor.black
        self.view.addSubview(fullName)
        
        //USERNAME UI TEXTFIELD
        username = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        username.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2  - 30)
        username.placeholder = " Username "
        username.borderStyle = UITextBorderStyle.roundedRect
        username.keyboardType = UIKeyboardType.default
        username.textColor = UIColor.black
        self.view.addSubview(username)
        
        //USERNAME UI TEXTFIELD
        email = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        email.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2 + 20)
        email.placeholder = " Email "
        email.borderStyle = UITextBorderStyle.roundedRect
        email.keyboardType = UIKeyboardType.default
        email.textColor = UIColor.black
        self.view.addSubview(email)
        
        //USERNAME UI TEXTFIELD
        password = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40.00));
        password.center = CGPoint(x: view.frame.width / 2 , y:  view.frame.height/2 + 70)
        password.placeholder = " Password "
        password.borderStyle = UITextBorderStyle.roundedRect
        password.keyboardType = UIKeyboardType.default
        password.isSecureTextEntry = true
        password.textColor = UIColor.black
        self.view.addSubview(password)
        
        //LOGIN BUTTON
        loginButton = UIButton(frame: CGRect(x: 0 , y: 0, width:  (view.frame.width / 2) - 4, height: 50))
        loginButton.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2 + 130)
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 20
        loginButton.backgroundColor = .blue
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        view.addSubview(loginButton)

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func loginButtonPressed(_ sender: Any){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
            if error != nil{
                print(error!)
            }else{
                print("Registration Successful")
                self.performSegue(withIdentifier: "toFeedSegue", sender: self)
            }
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
