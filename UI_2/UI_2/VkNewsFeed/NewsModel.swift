//
//  NewsModel.swift
//  UI_2
//
//  Created by Никита Алимпиев on 05.02.2022.
//

import UIKit

struct Post {
    var group: groupModel
    var descriptionPost: String?
    var imagePost: UIImage?
    var isLiked: Bool
    var likes: Int
}
