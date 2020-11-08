//
//  FilterDiffableDataSource.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/08.
//

import UIKit

class FilterDiffableDataSource {
    
    let tableView: UITableView
    var dataSource: UITableViewDiffableDataSource<Section, Filter>!
    
    init(with tableView: UITableView) {
        self.tableView = tableView
        configureDataSource()
    }
    
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
    
    func configureDataSource() {
        let cellProvider = { (tableView: UITableView, indexPath: IndexPath, filterContent: Filter) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FilterTableViewCell.reuseIdentifier, for: indexPath) as? FilterTableViewCell else { return UITableViewCell() }
            cell.titleLabel.text = filterContent.description
            cell.setSection(section: indexPath.section)
            return cell
        }
        dataSource = UITableViewDiffableDataSource<Section, Filter>(tableView: tableView, cellProvider: cellProvider)
        let snapshot = initSnapshot()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func initSnapshot() -> NSDiffableDataSourceSnapshot<Section, Filter> {
        let mainFilterContents = MainFilters().contents
        let detailFilterContents = DetailFilters().contents
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Filter>()
        snapshot.appendSections([.main, .detail])
        snapshot.appendItems(mainFilterContents, toSection: .main)
        snapshot.appendItems(detailFilterContents, toSection: .detail)
        return snapshot
    }
    
    func itemIdentifier(for indexPath: IndexPath) -> Filter? {
        return dataSource.itemIdentifier(for: indexPath)
    }
    
}
