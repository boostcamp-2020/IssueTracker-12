//
//  IssueFilterViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/05.
//

import UIKit

class IssueFilterViewController: UIViewController {

    @IBOutlet weak var filterTableView: UITableView!
    var dataSource: FilterDiffableDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterTableView.delegate = self
        dataSource = FilterDiffableDataSource(with: filterTableView)
    }
    
    @IBAction func cancelButtonDidTouch(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonDidTouch(_ sender: Any) {
        // 처리
        dismiss(animated: true, completion: nil)
    }
}

extension IssueFilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemGray6
        
        let label = UILabel()
        let sectionKind = FilterDiffableDataSource.Section(rawValue: section)
        label.text = sectionKind?.description
        label.textColor = .systemGray
        label.font = label.font.withSize(13)
        
        headerView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: -20),
            headerView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 4)
        ])
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
