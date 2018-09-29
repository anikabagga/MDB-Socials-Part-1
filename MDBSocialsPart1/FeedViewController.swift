//
//  FeedViewController.swift
//  MDBSocialsPart1
//
//  Created by Anika Bagga on 9/25/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import UIKit
import FirebaseAuth

class FeedViewController: UIViewController {
    var logoutButton: UIButton!
    var logoImage: UIImage!
    
    var selectedPost: Post!
    var posts: [Post] = []
    
    var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpArrayOfPosts()
        
        
        //DISPLAY MEASUREMENTS
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let frame = UIScreen.main.bounds
        
        //TABLE VIEW SETUP
        myTableView = UITableView(frame: CGRect(x: 0, y: frame.height*0.1 + 70, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(TableViewCells.self, forCellReuseIdentifier: "pokemonDisplay")
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.rowHeight = 200;
        view.addSubview(myTableView)
    }
    
    func setUpNavigationBar(){
        self.navigationItem.title = "My Feed"
        self.navigationController?.navigationBar.tintColor = .black
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        logoutButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        logoutButton.setTitle("Log Out", for: .normal)
        logoutButton.setTitleColor(.black, for: .normal)
        logoutButton.addTarget(self, action: #selector(logOutButtonPressed), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoutButton)
        print("log out button")
        
        let b = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.navigationItem.setRightBarButtonItems([b], animated: true)
        print("add button")

    }
    @objc func logOutButtonPressed(_ sender: UINavigationController){
        do{
            try Auth.auth().signOut()
        }catch{
            print("there was a problem signing out")
        }
        guard(navigationController?.popToRootViewController(animated: true))
            != nil
         else{
            print("You are signed out")
            return
        }
    }
    
    @objc func addTapped(_ sender: UINavigationController){
        performSegue(withIdentifier: "toNewSocialSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "feedToDetailSegue" {
            var destination = segue.destination as! DetailViewController
            destination.post = selectedPost
        }
    }


}
extension FeedViewController:  UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPost = posts[indexPath.row]
        self.performSegue(withIdentifier: "feedToDetailSegue", sender: self)
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
     }
}
