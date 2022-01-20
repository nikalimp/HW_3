//
//  FriendsViewController.swift
//  UI_2
//
//  Created by Никита Алимпиев on 20.12.2021.
//

import Foundation
import UIKit
import SDWebImage
import RealmSwift

final class FriendsViewController: UITableViewController{
    private var friendsAPI = FriendsAPI()
    private var friendsDB = FriendsDB()
    private var friends: Results<FriendDAO>?
    private var token: NotificationToken?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.friendsDB.deleteAll()
        
        friendsAPI.getFriends { [weak self] friends in
            guard let self = self else {return}
//            self.friends=friends
            self.friendsDB.save(friends)
            self.friends = self.friendsDB.fetch()
            //self.tableView.reloadData()
            self.token = self.friends?.observe(on: .main, {[weak self] changes in
                guard let self = self else { return }
                switch changes {
                case .initial:
                    self.tableView.reloadData()
                    
                case .update (_, let deletions, let insertions, let modifications):
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                    self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                    self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                    self.tableView.endUpdates()
                    
                case .error(let error):
                    print("\(error)")
                }
            })
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{

        guard let friends =  friends else { return 0 }

        return friends.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let friend = friends?[indexPath.row]

        cell.textLabel?.text = "\(friend?.firstName ?? "") \(friend?.lastName ?? "")"
        if let url = URL(string: friend?.photo100 ?? "") {
        //cell.imageView?.sd_setImage(with: url, completed: nil)
        cell.imageView?.sd_setImage(with: url, completed: { image, _, _, _ in
            tableView.reloadRows(at:[indexPath], with: .automatic)
            })
        }
            return cell
    }
}
   
