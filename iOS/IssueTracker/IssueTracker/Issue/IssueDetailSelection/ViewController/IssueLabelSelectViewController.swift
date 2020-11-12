//
//  IssueLabelSelectViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/11.
//

import UIKit
import Alamofire

class IssueLabelSelectViewController: UIViewController {
    
    @IBOutlet weak var issueLabelSelectTableView: UITableView!
    typealias IssueLabelSelectDataSource = UITableViewDiffableDataSource<Section, Label>
    private var labels = [Label]()
    private lazy var dataSource = createDataSource()
    var issue: Issue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        issueLabelSelectTableView.delegate = self
        applySnapshot()
        reloadLabels()
    }
    
    private func initSelection() {
        guard let issue = issue else { return }
        for (indexPath, label) in labels.enumerated() {
            if issue.labels.contains(label) {
                issueLabelSelectTableView.selectRow(at: IndexPath(row: indexPath, section: 0), animated: false, scrollPosition: .none)
            }
        }
    }
    
    private func createDataSource() -> IssueLabelSelectDataSource {
        let cellProvider = { (tableView: UITableView, indexPath: IndexPath, labelContent: Label) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IssueLabelSelectTableViewCell.reuseIdentifier, for: indexPath) as? IssueLabelSelectTableViewCell else { return UITableViewCell() }
            cell.labelColorView.backgroundColor = UIColor(hex: self.labels[indexPath.row].color)
            cell.labelNameLabel.text = self.labels[indexPath.row].labelName
            return cell
        }
        let dataSource = IssueLabelSelectDataSource(tableView: issueLabelSelectTableView, cellProvider: cellProvider)
        return dataSource
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Label>()
        snapshot.appendSections([.main])
        snapshot.appendItems(self.labels)
        self.dataSource.apply(snapshot)
    }
    
    private func reloadLabels() {
        DispatchQueue.main.async {
            NetworkManager.shared.getRequest(url: .label, type: LabelArray.self) { result in
                guard let labelArray = result else { return }
                self.labels = labelArray.labelArray
                self.applySnapshot()
                self.initSelection()
            }
        }
    }
    @IBAction func cancelButtonDidTouch(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonDidTouch(_ sender: Any) {
        guard let issue = issue else { return }
        var selectedLabelsId = [Int]()
        if let indexPaths =  issueLabelSelectTableView.indexPathsForSelectedRows {
            selectedLabelsId = indexPaths.map { self.labels[$0.row].labelId }
        }
        let object = ["labelArr": selectedLabelsId]
        
        NetworkManager.shared.patchRequest2(url: .issue, updateID: issue.issueId, object: object, type: .label) { result in
            print(result)
        }
        //TO-DO: 바뀐 내용을 detail화면에 적용해야됨
        dismiss(animated: true, completion: nil)
    }
    
    enum Section: Hashable {
        case main
    }
}

extension IssueLabelSelectViewController: UITableViewDelegate {
   
}
