//
//  FriendsViewController.swift
//  UI_2
//
//  Created by Никита Алимпиев on 20.12.2021.
//

import Foundation
import UIKit
import SDWebImage

final class FriendsViewController: UITableViewController{
    private var friendsAPI = FriendsAPI()
    private var friends: [FriendDTO]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        friendsAPI.getFriends { [weak self] friends in
            guard let self = self else {return}
            self.friends=friends
            
            self.tableView.reloadData()
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        return friends.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let friend:FriendDTO = friends[indexPath.row]
        
        cell.textLabel?.text="\(friend.firstName) \(friend.lastName)"
        if let url = URL(string: friend.photo50) {
        cell.imageView?.sd_setImage(with: url, completed: nil)
        }
            return cell
    }
}
