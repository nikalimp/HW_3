//
//  FriendDB.swift
//  UI_2
//
//  Created by Никита Алимпиев on 26.12.2021.
//

import Foundation
import RealmSwift

// MARK: - FriendDTO
class FriendDAO: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var photo100: String
    @objc dynamic var lastName: String
    @objc dynamic var photo50: String
    
    let trackCode: String?
    let isClosed: Bool?
    let firstName: String
    let domain: String
    
    enum CodingKeys: String, CodingKey {
        case domain, id
        case photo100 = "photo_100"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case trackCode = "track_code"
        case isClosed = "is_closed"
        case firstName = "first_name"
    }
}

final class FriendsDB {
    init() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 2)
    }
    func save(_ items: [FriendDAO]){
        let realm = try! Realm()
        try! realm.write {
            realm.add(items)
        }
        
    }
    
    func fetch () -> Results<FriendDAO> {
        let realm = try! Realm()
        let friends: Results<FriendDAO> = realm.objects(FriendDAO.self)
        return friends
    }
    
    func delete (_ item: FriendDAO) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(item)
        }
    }
}
