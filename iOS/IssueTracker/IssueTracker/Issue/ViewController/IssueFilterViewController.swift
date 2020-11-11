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
    private var labelFilters = [Filter]()
    private var milestonFilters = [Filter]()
    private var writerFilters = [Filter]()
    private var assigneeFilters = [Filter]()
    
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadWriterFilters()
        reloadLabelFilters()
        reloadMilestoneFilters()
        reloadAssigneeFilters()
        applySnapshot()
    }
    
    func createDataSource() -> FilterDataSource {
        let cellProvider = { (tableView: UITableView, indexPath: IndexPath, filterContent: Filter) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FilterTableViewCell.reuseIdentifier, for: indexPath) as? FilterTableViewCell else { return UITableViewCell() }
            cell.initCell(filter: filterContent, section: indexPath.section)
            return cell
        }
        let dataSource = FilterDataSource(tableView: filterTableView, cellProvider: cellProvider)
        return dataSource
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Filter>()
        snapshot.appendSections([.main, .detail])
        snapshot.appendItems(mainFilterContents, toSection: .main)
        snapshot.appendItems(detailFilterContents, toSection: .detail)
        dataSource.apply(snapshot)
    }
    
    func reloadWriterFilters() {
        NetworkManager.shared.getRequest(url: .user, type: UserArray.self) { result in
            guard let userArray = result else { return }
            self.writerFilters = userArray.userArray.map {
                Filter(criteria: WriterCriteria(writer: $0.userName), description: $0.userName, isChild: true)
            }
        }
    }
    
    func reloadLabelFilters() {
        NetworkManager.shared.getRequest(url: .label, type: LabelArray.self) { result in
            guard let labelArray = result else { return }
            self.labelFilters = labelArray.labelArray.map {
                Filter(criteria: LabelCriteria(labelId: $0.labelId), description: $0.labelName, isChild: true)
            }
        }
    }
    
    func reloadMilestoneFilters() {
        NetworkManager.shared.getRequest(url: .milestone, type: MilestoneArray.self) { result in
            guard let milestoneArray = result else { return }
            self.milestonFilters = milestoneArray.milestoneArray.map {
                Filter(criteria: MilestoneCriteria(milestoneId: $0.milestoneId), description: $0.title, isChild: true)
            }
        }
    }
    func reloadAssigneeFilters() {
        NetworkManager.shared.getRequest(url: .user, type: UserArray.self) { result in
            guard let userArray = result else { return }
            self.assigneeFilters = userArray.userArray.map {
                Filter(criteria: AssignedCriteria(assignee: $0), description: $0.userName, isChild: true)
            }
        }
    }
    
    @IBAction func cancelButtonDidTouch(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonDidTouch(_ sender: Any) {
        var mainFilters = [Filterable]()
        var detailFilters = [Filterable]()
        
        guard let indexPaths = filterTableView.indexPathsForSelectedRows else {
            NotificationCenter.default.post(name: .issueFilterDidChange, object: nil, userInfo: ["filters": []])
            dismiss(animated: true, completion: nil)
            return
        }
        indexPaths.forEach { indexPath in
            guard let filter = dataSource.itemIdentifier(for: indexPath)?.criteria else { return }
            if indexPath.section == 0 {
                mainFilters.append(filter)
            } else {
                detailFilters.append(filter)
            }
        }
        NotificationCenter.default.post(name: .issueFilterDidChange, object: nil, userInfo: ["mainFilters": mainFilters, "detailFilters": detailFilters])
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
        if !selectedItem.isChild && indexPath.section == 1 {
            switch selectedItem.criteria {
            case is WriterCriteria:
                reloadWriterFilters()
                selectedItem.setChildren(childItems: writerFilters)
            case is LabelCriteria:
                reloadLabelFilters()
                selectedItem.setChildren(childItems: labelFilters)
            case is MilestoneCriteria:
                reloadMilestoneFilters()
                selectedItem.setChildren(childItems: milestonFilters)
            case is AssignedCriteria:
                reloadAssigneeFilters()
                selectedItem.setChildren(childItems: assigneeFilters)
            default:
                break
            }
        }
        
        if selectedItem.childItems.count > 0 {
            detailFilterContents.insert(contentsOf: selectedItem.childItems, at: indexPath.row + 1)
            applySnapshot()
        }
        cell.initCell(filter: selectedItem, section: indexPath.section)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let selectedItem = dataSource.itemIdentifier(for: indexPath),
              let cell = tableView.cellForRow(at: indexPath) as? FilterTableViewCell else { return }
        if selectedItem.childItems.count > 0 {
            let range = indexPath.row + 1...indexPath.row + selectedItem.childItems.count
            detailFilterContents.removeSubrange(range)
            applySnapshot()
        }
        cell.initCell(filter: selectedItem, section: indexPath.section)
    }
}
