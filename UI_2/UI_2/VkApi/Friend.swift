////
////  Friend.swift
////  UI_2
////
////  Created by Никита Алимпиев on 20.12.2021.
////
//
//import Foundation
//
//// MARK: - FriendsContainer
//struct FriendsContainer: Codable {
//    let response: FriendsResponse
//}
//
//// MARK: - Response
//struct FreindsResponse: Codable {
//    let count: Int
//    let items: [Friend]
//}
//
//// MARK: - Friend
//struct Friend: Codable {
//    let canAccessClosed: Bool?
//    let id: Int
//    let photo100: String
//    let lastName: String
//    let photo50: String
//    let trackCode: String?
//    let isClosed: Bool?
//    let firstName: String
//    let deactivated: String?
//
//    enum CodingKeys: String, CodingKey {
//        case canAccessClosed = "can_access_closed"
//        case id
//        case photo100 = "photo_100"
//        case lastName = "last_name"
//        case photo50 = "photo_50"
//        case trackCode = "track_code"
//        case isClosed = "is_closed"
//        case firstName = "first_name"
//        case deactivated
//    }
//}
