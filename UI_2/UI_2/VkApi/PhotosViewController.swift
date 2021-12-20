////
////  PhotosViewController.swift
////  UI_2
////
////  Created by Никита Алимпиев on 20.12.2021.
////
//
//import Foundation
//import UIKit
//
//    final class PhotosViewController: UITableViewController{
//        private var friendsAPI = FriendsAPI()
//        private var friends: [Friend]=[]
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            
//            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//            
//            friendsAPI.getFriends { [weak self] friends in
//                guard let self = self else {return}
//                self.friends=friends
//                
//                self.tableView.reloadData()
//            }
//            
//        }
//        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{
//            return friends.count
//        }
//        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//            cell.textLabel?.text=friends[indexPath.row].firstName
//            
//            return cell
//        }
//    }
