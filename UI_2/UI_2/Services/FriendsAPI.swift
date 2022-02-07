//
//  FriendsAPI.swift
//  UI_2
//
//  Created by Никита Алимпиев on 20.12.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

final class FriendsAPI{
    let baseUrl = "https://api.vk.com/method"
    let userId = Session.shared.userId
    let accessToken = Session.shared.token
    let version = "5.131"
//    func getFriends(completion: @escaping([Friend])->()) {
//
//        let path = "/friends.get"
//        let url = baseUrl + path
//
//        let params: [String:String] = [
//            "user_id": userId,
//            "order": "name",
//            "count": "5",
//            "fields":"photo_100, photo_50",
//            "access_token":accessToken,
//            "v":version
//        ]
//
//        AF.request(url, method: .get, parameters: params).responseJSON {response in
//
//        //    print (response.result)}
//        print (response.data?.prettyJSON)
//
//            guard let jsonData = response.data else{return}
//
//        let friendsContainer = try? JSONDecoder().decode(FriendsContainer.self, from: jsonData)
//
//            guard let friends = friendsContainer?.response.items else {return}
//            completion(friends)
//        }
//    }

    func getFriends(completion: @escaping([FriendDAO])->()){
        let path = "/friends.get"
        let url = baseUrl + path
        
        let params: [String:String] = [
            "user_id": userId,
            "order": "name",
            "count": "40",
            "fields":"photo_100, photo_50",
            "access_token":accessToken,
            "v":version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON {response in
            
        //    print (response.result)}
        print (response.data?.prettyJSON)
            
            guard let jsonData = response.data else{return}
            
            do {
            let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                let friends = try JSONDecoder().decode([FriendDAO].self, from: itemsData)
            completion(friends)
            }
            catch {print(error)}
        }
    }
    }


