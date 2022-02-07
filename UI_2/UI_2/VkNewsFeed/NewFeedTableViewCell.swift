//
//  NewFeedTableViewCell.swift
//  UI_2
//
//  Created by Никита Алимпиев on 05.02.2022.
//

import UIKit

var posts = [
    Post(group: groupModel(nameGroup: "Аня Вандышева", imageGroup: UIImage(named: "Вандышева1")),
         descriptionPost: "Кофе",
         imagePost: UIImage(named: "Вандышева1"),
         isLiked: false,
         likes: 0),
]

class NewFeedTableViewCell: UITableViewCell {
    @IBOutlet weak var imageGroup: UIImageView!
    @IBOutlet weak var nameGroupLabel: UILabel!
    @IBOutlet weak var descriptionPostLabel: UILabel!
    @IBOutlet weak var superImageView: UIView!
    @IBOutlet weak var oneImageView: UIImageView!
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    
    func recognizerView() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(addLike))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        likeView.addGestureRecognizer(recognizer)
    }
    
    var indexPathRow: Int?
    
    @objc func addLike() {
        
        guard let indexPathRowCell = indexPathRow else { return }
        if !posts[indexPathRowCell].isLiked {
            posts[indexPathRowCell].likes += 1
            likeCount.text = String(posts[indexPathRowCell].likes)
            posts[indexPathRowCell].isLiked = true
            
            UIView.transition(with: likeImage,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { [weak self] in
                                self?.likeImage.image = UIImage(systemName: "heart.fill")
                                self?.likeImage.tintColor = .red
                              })
        } else {
            posts[indexPathRowCell].likes -= 1
            likeCount.text = String(posts[indexPathRowCell].likes)
            posts[indexPathRowCell].isLiked = false
            
            UIView.transition(with: likeImage,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { [weak self] in
                                self?.likeImage.image = UIImage(systemName: "heart")
                                self?.likeImage.tintColor = .systemGray2
                              })
        }
    }
    func setup() {
        
        guard let indexPathRowCell = indexPathRow else { return }
        
        if posts[indexPathRowCell].isLiked {
            likeImage.image = UIImage(systemName: "heart.fill")
            likeImage.tintColor = .red
        }
    }
    func configurate(post: Post?, indexPath: Int) {
        guard let post = post else { return }
        
        imageGroup.image = post.group.imageGroup
        nameGroupLabel.text = post.group.nameGroup
        descriptionPostLabel.text = post.descriptionPost
        oneImageView.image = post.imagePost
        likeCount.text = String(post.likes)
        
        indexPathRow = indexPath
        
        setup()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        recognizerView()
    }
}
