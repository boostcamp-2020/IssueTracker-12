//
//  IssueFilterViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/05.
//

import UIKit

class IssueFilterViewController: UIViewController {

    @IBOutlet weak var filterTableView: UITableView!
    
    typealias FilterDataSource = UITableViewDiffableDataSource<Section, Filter>
    private var mainFilterContents = MainFilters().contents
    private var detailFilterContents = DetailFilters().contents
    private lazy var dataSource = createDataSource()
    
    enum Section: Int, CustomStringConvertible {
        case main
        case detail
        
        var description: String {
            switch self {
            case .main: return "다음 중에 조건을 고르세요"
            case .detail: return "세부 조건"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterTableView.delegate = self
        applySnapshot()
    }
    
    func createDataSource() -> FilterDataSource {
        let cellProvider = { (tableView: UITableView, indexPath: IndexPath, filterContent: Filter) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FilterTableViewCell.reuseIdentifier, for: indexPath) as? FilterTableViewCell else { return UITableViewCell() }
            cell.initCell(filter: filterContent, section: indexPath.section)
            return cell
        }
        let dataSource = UITableViewDiffableDataSource<Section, Filter>(tableView: filterTableView, cellProvider: cellProvider)
        return dataSource
    }
    
    func applySnapshot() {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Filter>()
        snapshot.appendSections([.main, .detail])
        snapshot.appendItems(mainFilterContents, toSection: .main)
        snapshot.appendItems(detailFilterContents, toSection: .detail)
        self.dataSource.apply(snapshot)
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
        let sectionKind = Section(rawValue: section)
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedItem = dataSource.itemIdentifier(for: indexPath),
              let cell = tableView.cellForRow(at: indexPath) as? FilterTableViewCell else { return }
        if selectedItem.childItem.count > 0 {
            detailFilterContents.insert(contentsOf: selectedItem.childItem, at: indexPath.row + 1)
            applySnapshot()
        }
        cell.initCell(filter: selectedItem, section: indexPath.section)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let selectedItem = dataSource.itemIdentifier(for: indexPath),
              let cell = tableView.cellForRow(at: indexPath) as? FilterTableViewCell else { return }
        if selectedItem.childItem.count > 0 {
            let range = indexPath.row + 1...indexPath.row + selectedItem.childItem.count
            detailFilterContents.removeSubrange(range)
            applySnapshot()
        }
        cell.initCell(filter: selectedItem, section: indexPath.section)
    }
}
