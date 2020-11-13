//
//  IssueAssigneeSelectViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/11.
//

import UIKit

class IssueAssigneeSelectViewController: UIViewController {
    
    @IBOutlet weak var issueAssigneeSelectTableView: UITableView!
    typealias IssueAssigneeSelectDataSource = UITableViewDiffableDataSource<Section, User>
    private var assignees = [User]()
    private lazy var dataSource = createDataSource()
    var issue: Issue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        issueAssigneeSelectTableView.delegate = self
        applySnapshot()
        reloadAssignees()
    }
    
    private func createDataSource() -> IssueAssigneeSelectDataSource {
        let cellProvider = { (tableView: UITableView, indexPath: IndexPath, assigneeContent: User) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IssueAssigneeSelectTableViewCell.reuseIdentifier, for: indexPath) as? IssueAssigneeSelectTableViewCell else { return UITableViewCell() }
            cell.assigneeImageView.image = UIImage(named: "cat") // 나중에 바꾸자
            cell.assigneeNameLabel.text = self.assignees[indexPath.row].userName
            return cell
        }
        let dataSource = IssueAssigneeSelectDataSource(tableView: issueAssigneeSelectTableView, cellProvider: cellProvider)
        return dataSource
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, User>()
        snapshot.appendSections([.main])
        snapshot.appendItems(self.assignees)
        self.dataSource.apply(snapshot)
    }
    
    private func reloadAssignees() {
        DispatchQueue.main.async {
            NetworkManager.shared.getRequest(url: .user, type: UserArray.self) { result in
                guard let userArray = result else { return }
                self.assignees = userArray.userArray
                self.applySnapshot()
                self.initSelection()
            }
        }
    }
    
    private func initSelection() {
        guard let issue = issue else { return }
        for (indexPath, assignee) in assignees.enumerated() {
            if issue.assignee.contains(assignee) {
                issueAssigneeSelectTableView.selectRow(at: IndexPath(row: indexPath, section: 0), animated: false, scrollPosition: .none)
            }
        }
    }
    
    @IBAction func cancelButtonDidTouch(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonDidTouch(_ sender: Any) {
        guard let issue = issue else { return }
        var selectedAssigneesId = [Int]()
        if let indexPaths =  issueAssigneeSelectTableView.indexPathsForSelectedRows {
            selectedAssigneesId = indexPaths.map { self.assignees[$0.row].userId }
        }
        let object = ["assigneeArr": selectedAssigneesId]
        
        NetworkManager.shared.patchRequest2(url: .issue, updateID: issue.issueId, object: object, type: .assignee) { result in
            print(result)
            NotificationCenter.default.post(name: .issueDidChange, object: nil)
        }
        dismiss(animated: true, completion: nil)
    }
    
    enum Section: Hashable {
        case main
    }
}

extension IssueAssigneeSelectViewController: UITableViewDelegate {
    
}
