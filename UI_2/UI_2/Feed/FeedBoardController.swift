//
//  FeedBoardController.swift
//  UI_2
//
//  Created by Никита Алимпиев on 28.11.2021.
//

import UIKit
class FeedBoardController: UITableViewController {
    var boards = [
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
    return boards.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // Получаем ячейку из пула
    let cell = tableView.dequeueReusableCell(withIdentifier: "BoardCell", for: indexPath) as! AllBoardsCell
    // Получаем город для конкретной строки
    let board = boards[indexPath.row]
    // Устанавливаем город в надпись ячейки
    cell.boardName.text = board
    return cell
        }

    enum Theme: Int {
        case marketing, psychology, softskills
        
        static let allThemes: [Theme] = [marketing, psychology, softskills]
        
        var title: String {
            switch self {
            case .marketing: return "Маркетинг"
            case .psychology: return "Психиология"
            case .softskills: return "Soft-skills"
            }
        }
    }

    @IBDesignable class ThemePicker: UIControl {
        
        var selectedTheme: Theme? = nil {
            didSet {
                self.updateSelectedTheme()
                self.sendActions(for: .valueChanged)
            }
        }
        
        private var buttons: [UIButton] = []
        private var stackView: UIStackView!
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupView()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.setupView()
        }
        
        private func setupView() {
            for theme in Theme.allThemes {
                let button = UIButton(type: .system)
                button.setTitle(theme.title, for: .normal)
                button.setTitleColor(.lightGray, for: .normal)
                button.setTitleColor(.white, for: .selected)
                button.addTarget(self, action: #selector(selectTheme(_:)), for: .touchUpInside)
                self.buttons.append(button)
            }
            stackView = UIStackView(arrangedSubviews: self.buttons)
                   
                   self.addSubview(stackView)
                   
                   stackView.spacing = 8
                   stackView.axis = .horizontal
                   stackView.alignment = .center
                   stackView.distribution = .fillEqually
               }
               
               private func updateSelectedTheme() {
                   for (index, button) in self.buttons.enumerated() {
                       guard let theme = Theme(rawValue: index) else { continue }
                       button.isSelected = theme == self.selectedTheme
                   }
               }
               
               @objc private func selectTheme(_ sender: UIButton) {
                   guard let index = self.buttons.index(of: sender) else { return }
                   guard let theme = Theme(rawValue: index) else { return }
                   self.selectedTheme = theme
               }
               
               override func layoutSubviews() {
                   super.layoutSubviews()
                   stackView.frame = bounds
               }
               
           }

}
