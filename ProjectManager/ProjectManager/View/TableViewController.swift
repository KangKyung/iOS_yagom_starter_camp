//
//  TableViewController.swift
//  ProjectManager
//
//  Created by 강경 on 2021/06/29.
//

import UIKit

class TableViewController: UIViewController {
    let viewModel = TableViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var centerTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    @IBOutlet weak var tableRowCount: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableRowCount.text = "\(viewModel.numOfList)"
        tableRowCount.layer.masksToBounds = true
        tableRowCount.layer.cornerRadius = 12
    }
    
    @IBAction func cliskPlusButton(_ sender: Any) {
        performSegue(
            withIdentifier: "addNewTODO",
            sender: nil
        )
    }
}

// MARK: - UITableView UITableViewDelegate
extension TableViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableView UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.numOfList
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: LeftTableViewCell.cellIdentifier,
            for: indexPath
        ) as? LeftTableViewCell
        else {
            return UITableViewCell()
        }
        
        let listInfo = viewModel.itemInfo(at: indexPath.row)
        cell.update(info: listInfo)
        
        return cell
    }
}