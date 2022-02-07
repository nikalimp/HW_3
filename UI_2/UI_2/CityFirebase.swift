//
//  CityFirebase.swift
//  UI_2
//
//  Created by Никита Алимпиев on 20.01.2022.
//

import Foundation
import Firebase

class CityFirebase {
    
    let name: String
    let zipcode: Int
    let ref: DatabaseReference?
    
    init(name: String, zipcode: Int) {
        self.ref = nil
        self.name = name
        self.zipcode = zipcode
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: Any],
            let zipcode = value["zipcode"] as? Int,
            let name = value["name"] as? String else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.name = name
        self.zipcode = zipcode
    }
    func toAnyObject() -> [String: Any] {
        return [
            "name": name,
            "zipcode": zipcode
        ]
    }
}
