//
//  LectureViewController.swift
//  UI_2
//
//  Created by Никита Алимпиев on 14.11.2021.
//

import UIKit

class LectureViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 2
        }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LectureCell", for: indexPath) as! LectureCell
        
        cell.lecture.text = "SMM"
            return cell
        }
}
