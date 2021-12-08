//
//  MyLecturesController.swift
//  UI_2
//
//  Created by Никита Алимпиев on 11.11.2021.
//

import UIKit
class MyLecturesController: UITableViewController {
    var lectures = [String]()
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return lectures.count
        }
        
    @IBAction func addLecture(segue: UIStoryboardSegue) {
        // Проверяем идентификатор перехода, чтобы убедиться, что это нужный
             if segue.identifier == "addLecture" {
             // Получаем ссылку на контроллер, с которого осуществлен переход
                 guard let allLecturesController = segue.source as? AllLecturesController else { return }
             // Получаем индекс выделенной ячейки
                 if let indexPath = allLecturesController.tableView.indexPathForSelectedRow {
             // Получаем город по индексу
                     let lecture = allLecturesController.lectures[indexPath.row]
             // Проверяем, что такого города нет в списке
                     if !lectures.contains(lecture) {
             // Добавляем город в список выбранных
                         lectures.append(lecture)
             // Обновляем таблицу
                         tableView.reloadData()
                     }
                 }
             }
    }


        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            // Получаем ячейку из пула
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyLecturesCell", for: indexPath) as! MyLecturesCell
            // Получаем тему для конкретной строки
            let theme = lectures[indexPath.row]
            
            // Устанавливаем город в надпись ячейки
            cell.lectureName.text = theme
            
            return cell
        }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            // Если была нажата кнопка «Удалить»
            if editingStyle == .delete {
            // Удаляем город из массива
                lectures.remove(at: indexPath.row)
            // И удаляем строку из таблицы
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }

}
