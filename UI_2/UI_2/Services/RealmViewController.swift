//
//  RealmViewController.swift
//  UI_2
//
//  Created by Никита Алимпиев on 25.12.2021.
//

import UIKit
import RealmSwift

@objcMembers
class PersonDAO: Object {
    dynamic var name = ""
    dynamic var age = 0
    dynamic var gender = ""
    dynamic var instagram = ""
}

class RealmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let person = PersonDAO ()
        person.name = "Nik"
        person.age = 22
        person.gender = "m"
        person.instagram = "nikita.alimpiev"
        
        let migration = Realm.Configuration(schemaVersion: 2)
        let mainRealm = try! Realm(configuration: migration)

//    do {
        mainRealm.beginWrite()
        mainRealm.add(person)
        try! mainRealm.commitWrite()
//    } catch {
//        print(error)
//    }

    print (mainRealm.configuration.fileURL)
    
    let persons = mainRealm.objects(PersonDAO.self)
        persons.forEach { print($0.name, $0.age, $0.gender, $0.instagram) }

    mainRealm.beginWrite()
    mainRealm.delete(person)
    try! mainRealm.commitWrite()
    
    }
    
}
