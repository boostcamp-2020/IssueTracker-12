//
//  IssueMilestoneSelectViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/11.
//

import UIKit

class IssueMilestoneSelectViewController: UIViewController {

    @IBOutlet weak var issueMilestoneSelectTableView: UITableView!
    typealias IssueMilestoneSelectDataSource = UITableViewDiffableDataSource<Section, Milestone>
    private var milestones = [Milestone]()
    private lazy var dataSource = createDataSource()
    var issue: Issue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        issueMilestoneSelectTableView.delegate = self
        applySnapshot()
        reloadMilestones()
    }
    
    private func createDataSource() -> IssueMilestoneSelectDataSource {
        let cellProvider = { (tableView: UITableView, indexPath: IndexPath, milestoneContent: Milestone) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IssueMilestoneSelectTableViewCell.reuseIdentifier, for: indexPath) as? IssueMilestoneSelectTableViewCell else { return UITableViewCell() }

            cell.milestoneTitleLabel.text = self.milestones[indexPath.row].title
            cell.dueDateLabel.text = self.milestones[indexPath.row].dueDate
            return cell
        }
        let dataSource = IssueMilestoneSelectDataSource(tableView: issueMilestoneSelectTableView, cellProvider: cellProvider)
        return dataSource
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Milestone>()
        snapshot.appendSections([.main])
        snapshot.appendItems(self.milestones)
        self.dataSource.apply(snapshot)
    }
    
    private func reloadMilestones() {
        DispatchQueue.main.async {
            NetworkManager.shared.getRequest(url: .milestone, type: MilestoneArray.self) { result in
                guard let milestoneArray = result else { return }
                self.milestones = milestoneArray.milestoneArray
                self.applySnapshot()
                self.initSelection()
            }
        }
    }
    
    private func initSelection() {
        guard let issue = issue else { return }
        for (indexPath, milestone) in milestones.enumerated() {
            if issue.milestoneTitle == milestone.title {
                issueMilestoneSelectTableView.selectRow(at: IndexPath(row: indexPath, section: 0), animated: false, scrollPosition: .none)
            }
        }
    }
    
    @IBAction func cancelButtonDidTouch(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonDidTouch(_ sender: Any) {
        //추후 구현
        dismiss(animated: true, completion: nil)
    }
    
    enum Section: Hashable {
        case main
    }
}

extension IssueMilestoneSelectViewController: UITableViewDelegate {
    
}
