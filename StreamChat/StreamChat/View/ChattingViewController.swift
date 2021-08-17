//
//  ChattingViewController.swift
//  StreamChat
//
//  Created by 강경 on 2021/08/17.
//

import UIKit

class BubbleCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
}

struct Chat {
    
    let message: String
    let isMyMessage: Bool = Bool.random()
}

class ChattingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    private var chats: [Chat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil, queue: .main) { (notification) in
            guard let userInfo = notification.userInfo else {
                return
            }
            guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
            else {
                return
            }
            self.bottomConstraint.constant = keyboardFrame.height - 25
            
            guard let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey]
                    as? TimeInterval else {
                return
            }
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil, queue: .main) { (notification) in
            guard let userInfo = notification.userInfo,
                  let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as?
                    TimeInterval else {
                return
            }
            self.bottomConstraint.constant = 8
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
    }
    @IBAction func sendMessage() {
        guard let text = messageField.text,
              text.isEmpty == false else {
            return
        }
        chats.append(Chat(message: text))
        messageField.text = nil
        
        let indexPath = IndexPath(row: chats.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.none)
        tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
    }
}

extension ChattingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chat = chats[indexPath.row]
        let identifier = chat.isMyMessage ? "RightCell" : "LeftCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                 for: indexPath) as? BubbleCell else {
            return UITableViewCell()
        }
        cell.label.text = chat.message
        
        return cell
    }
}
