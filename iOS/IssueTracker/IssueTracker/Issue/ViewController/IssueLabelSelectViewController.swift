//
//  IssueLabelSelectViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/11.
//

import UIKit

class IssueLabelSelectViewController: UIViewController {
    
    @IBOutlet weak var issueLabelSelectTableView: UITableView!
    typealias IssueLabelSelectDataSource = UITableViewDiffableDataSource<Section, Label>
    private var labels = [Label]()
    private lazy var dataSource = createDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        issueLabelSelectTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadLabels()
        //applySnapshot()
    }
    
    private func createDataSource() -> IssueLabelSelectDataSource {
        let cellProvider = { (tableView: UITableView, indexPath: IndexPath, labelContent: Label) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IssueLabelSelectTableViewCell.reuseIdentifier, for: indexPath) as? IssueLabelSelectTableViewCell else { return UITableViewCell() }
            cell.labelColorView.backgroundColor = UIColor(hex: self.labels[indexPath.row].color)
            return cell
        }
        let dataSource = IssueLabelSelectDataSource(tableView: issueLabelSelectTableView, cellProvider: cellProvider)
        return dataSource
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Label>()
        snapshot.appendSections([.main])
        snapshot.appendItems(labels)
        dataSource.apply(snapshot)
    }
    
    private func reloadLabels() {
        NetworkManager.shared.getRequest(url: .label, type: LabelArray.self) { result in
            guard let labelArray = result else { return }
            self.labels = labelArray.labelArray
            self.applySnapshot()
        }
    }
    
    enum Section: Hashable {
        case main
    }
}

extension IssueLabelSelectViewController: UITableViewDelegate {
    
}
