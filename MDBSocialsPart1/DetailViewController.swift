//
//  DetailViewController.swift
//  MDBSocialsPart1
//
//  Created by Anika Bagga on 9/25/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //var post: Post!
    
    var postImage: UIImageView!
    var descriptionLabel: UILabel!
    var posterLabel: UILabel!
    var numInterested: UILabel!
    
    var interestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initializePage()
        
        postImage = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 200))
        postImage.center = CGPoint(x: view.frame.width * 0.1, y: 130)
        view.addSubview(postImage)
        
        //self.navigationItem.title = Post.eventName!
        self.navigationController?.navigationBar.tintColor = .black
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
       
        interestButton = UIButton(frame: CGRect(x: 0 , y: 0, width:  (view.frame.width / 2) - 4, height: 50))
        interestButton.center = CGPoint(x: view.frame.width / 2, y:  view.frame.height/2 + 130)
        interestButton.layer.cornerRadius = 20
        interestButton.backgroundColor = .blue
        //interestButton.addTarget(self, action: #selector(interestButtonPressed), for: .touchUpInside)
        view.addSubview(interestButton)
        
        numInterested = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        numInterested.center = CGPoint(x: view.frame.width / 2, y: view.frame.height/2 + 120)
        numInterested.textAlignment = .center
        numInterested.adjustsFontSizeToFitWidth = true
        //numInterested.text = "Number of Members Interested:"
        self.view.addSubview(numInterested)
        
        descriptionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        descriptionLabel.center = CGPoint(x: view.frame.width / 2, y: view.frame.height/2 + 120)
        descriptionLabel.textAlignment = .center
        descriptionLabel.adjustsFontSizeToFitWidth = true
        //numInterested.text = "Number of Members Interested:"
        self.view.addSubview(descriptionLabel)
        
        posterLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        posterLabel.center = CGPoint(x: view.frame.width / 2, y: view.frame.height/2 + 120)
        posterLabel.textAlignment = .center
        posterLabel.adjustsFontSizeToFitWidth = true
        //numInterested.text = "Number of Members Interested:"
        self.view.addSubview(posterLabel)
        
    }
    
//    func viewWillAppear(){
//        navigationItem.title = post.eventName!
//        mainImageView.image = post.image ?? UIImage(named: "defaultImage")
//        initializeInterestedButtonState()
//        descriptionLabel.text = post.description
//        interestedLabel.text = "Members Interested: " + String(describing: post.interestedIds.count)
//        posterNameLabel.text = "Posted By: " + post.posterName!
//    }
    
//
//    func initializeInterestButtonState(){
//        var userHasSaidInterested = false
//        for id in post.interestedIds {
//            if id == FirebaseHelper.getCurrentUser()?.uid {
//                userHasSaidInterested = true
//                break
//            }
//        }
//
//        if userHasSaidInterested{
//            interestButton.setTitle("I'm Already Interested!!", for: .normal)
//            interestButton.isUserInteractionEnabled = false
//        }else{
//            interestButton.setTitle("I'm Interested!!", for: .normal)
//            interestButton.isUserInteractionEnabled = true
//        }
//    }
    
//    @objc func interestButtonPressed(){
//        FirebaseDatabaseHelper.updateInterested(postId: post.id!, userId: (FirebaseAuthHelper.getCurrentUser()?.uid)!) {
//
//            interestButton.setTitle("I'm Already Interested!!", for: .normal)
//            nterestButton.isUserInteractionEnabled = false
//            post.interestedIds.append((FirebaseAuthHelper.getCurrentUser()?.uid)!)
//            interestedLabel.text = "Members Interested: " + String(describing: post.interestedIds.count)
//        }
//    }
    override func viewWillAppear(_ animated: Bool) {
        //postImage.image = post.image ?? UIImage(named: "img-placeholder")
        
    }
    
    func backToFeed(){
        self.performSegue(withIdentifier: "detailToFeedSegue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
