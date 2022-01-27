//
//  HomeViewController.swift
//  UI_2
//
//  Created by Никита Алимпиев on 20.01.2022.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    let authService = Auth.auth()
    
    let ref = Database.database().reference(withPath: "cities")
    
    var cities: [CityFirebase] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref.observe(.value, with: { snapshot in
            print(snapshot.value as Any)
            var cities: [CityFirebase] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let city = CityFirebase (snapshot: snapshot){
                    cities.append(city)
                }
            }
            self.cities = cities
            self.cities.map { print($0.name, $0.zipcode)}

        })
        
    }
    
    @IBAction func signOutAction(_ sender: Any) {
        
        try? authService.signOut()
        showLoginViewController()
    }
    @IBAction func addCityAction(_ sender: Any) {
        
        let city = CityFirebase(name: "Ekaterinburg", zipcode: 620140)
        
        let cityContainerRef = self.ref.child(city.name)
        
        cityContainerRef.setValue(city.toAnyObject())
        
    }
    
    private func showLoginViewController() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else { return }
        guard let window = self.view.window else { return }
        window.rootViewController = vc
    }
    
}