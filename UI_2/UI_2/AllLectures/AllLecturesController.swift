//
//  AllLecturesController.swift
//  UI_2
//
//  Created by Никита Алимпиев on 11.11.2021.
//

import UIKit
class AllLecturesController: UITableViewController {
    var lectures = [
    "SMM",
    "Marketing",
    "UI/UX",
    "Design"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return lectures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // Получаем ячейку из пула
    let cell = tableView.dequeueReusableCell(withIdentifier: "LectureCell", for: indexPath) as! AllLecturesCell
    // Получаем город для конкретной строки
    let lecture = lectures[indexPath.row]
    // Устанавливаем город в надпись ячейки
    cell.lectureName.text = lecture
    return cell
        }
}
