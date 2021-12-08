//
//  Session.swift
//  UI_2
//
//  Created by Никита Алимпиев on 08.12.2021.
//

import Foundation
final class Session {
     private init() {}
     static let shared = Session()
     var token: String = ""
     var userId: Int = 0
 }
