//
//  IssueListEditViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/26.
//

import UIKit

class IssueListEditViewController: UIViewController {

    @IBOutlet weak var issueListTableView: UITableView!
    @IBOutlet weak var selectAllButton: UIBarButtonItem!
    @IBOutlet weak var selectedNumberLabel: UILabel!
    private var isSelectAll: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        issueListTableView.dataSource = self
        issueListTableView.delegate = self
        issueListTableView.allowsMultipleSelection = true
        tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func cancelButtonDidTouch(_ sender: Any) {
        tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectAllButtonDidTouch(_ sender: Any) {
        for indexPath in indexPaths {
            if isSelectAll {
            issueListTableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            } else {
                issueListTableView.deselectRow(at: indexPath, animated: true)
            }
        }
        if isSelectAll {
            selectAllButton.title = "DeselectAll"
            isSelectAll = false
        } else {
            selectAllButton.title = "SelectAll"
            isSelectAll = true
        }
        selectedNumberLabel.text = "\(self.issueListTableView.indexPathsForSelectedRows?.count ?? 0)개 선택"
    }
    
    @IBAction func selectedIssueCloseButtonDidTouch(_ sender: Any) {
        //issueListTableView.indexPathsForSelectedRows
    }
    
}

extension IssueListEditViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IssueListEditTableViewCell.reuseIdentifier, for: indexPath) as? IssueListEditTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNumberLabel.text = "\(self.issueListTableView.indexPathsForSelectedRows?.count ?? 0)개 선택"
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedNumberLabel.text = "\(self.issueListTableView.indexPathsForSelectedRows?.count ?? 0)개 선택"
    }
    
    /// issueListEditTableView의 모든 indexPath를 반환
    public var indexPaths: [IndexPath] {
         return (0..<issueListTableView.numberOfSections).indices.map { (sectionIndex: Int) -> [IndexPath] in
            (0..<issueListTableView.numberOfRows(inSection: sectionIndex)).indices.compactMap { (rowIndex: Int) -> IndexPath? in
               IndexPath(row: rowIndex, section: sectionIndex)
            }
            }.flatMap { $0 }
      }
    
}
