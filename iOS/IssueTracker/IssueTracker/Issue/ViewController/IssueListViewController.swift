//
//  ViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/26.
//

import UIKit
//import SwipeCellKit

class IssueListViewController: UIViewController {
    
    @IBOutlet weak var issueListSearchBar: UISearchBar!
    @IBOutlet weak var issueListCollectionView: UICollectionView!
    
    typealias IssueDataSource = UICollectionViewDiffableDataSource<Section, Issue>
    private lazy var dataSource = createDataSource()
    
    private var issues = [Issue]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        reloadIssues()
    }
    
    func configure() {
        
        issueListCollectionView.collectionViewLayout = createCollectionViewLayout()
        issueListCollectionView.delegate = self

        let cellNibName = UINib(nibName: IssueListCollectionViewCell.reuseIdentifier, bundle: nil)
        self.issueListCollectionView.register(cellNibName, forCellWithReuseIdentifier: IssueListCollectionViewCell.reuseIdentifier)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadIssues), name: .issueDidChange, object: nil)
    }
    
    private func createDataSource() -> IssueDataSource {
        
        let dataSource = IssueDataSource(
            collectionView: issueListCollectionView,
            cellProvider: { (collectionView, indexPath, issue) -> UICollectionViewCell? in
                
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IssueListCollectionViewCell.reuseIdentifier, for: indexPath)
                    as? IssueListCollectionViewCell else { return UICollectionViewCell() }
            cell.initIssueCell(issue: issue)
            
            return cell
        })
        return dataSource
    }
    
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.trailingSwipeActionsConfigurationProvider = { [unowned self] (indexPath) in
            
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {(_, _, completion) in
                // issue delete 가 구현이 안되어있음
//                NetworkManager.shared.deleteRequest(
//                    url: .issue,
//                    deleteID: self.issues[indexPath.row].issueId) { (nsDictionary) in
//
//                    NotificationCenter.default.post(name: .issueDidChange, object: nil)
//                }
//                completion(true)
            }
            
            let closeAction = UIContextualAction(style: .destructive, title: "Close") {(_, _, completion) in
//                NetworkManager.shared.deleteRequest(
//                    url: .issue,
//                    deleteID: self.issues[indexPath.row].issueId) { (nsDictionary) in
//
//                    NotificationCenter.default.post(name: .issueDidChange, object: nil)
//                }
//                completion(true)
            }
            
            closeAction.backgroundColor = UIColor(named: "closeGreen")
            closeAction.image = UIImage(named: "closed")?.withTintColor(UIColor.white)
            deleteAction.image = UIImage(named: "delete")?.withTintColor(UIColor.white)
            
            return UISwipeActionsConfiguration(actions: [closeAction, deleteAction])
        }
        
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
    
    @objc func reloadIssues() {
        
        DispatchQueue.main.async {
            NetworkManager.shared.getRequest(url: .issue, type: IssueArray.self) { result in
                guard let issueArray = result else { return }
                self.issues = issueArray.issueArray
                
                var snapshot = NSDiffableDataSourceSnapshot<Section, Issue>()
                snapshot.appendSections([.main])
                snapshot.appendItems(self.issues)
                self.dataSource.apply(snapshot)
            }
        }
    }
    
    @IBAction func newIssueButtonDidTouch(_ sender: UIButton) {
        if let newVC = self.storyboard?.instantiateViewController(identifier: NewIssueViewController.reuseIdentifier) as? NewIssueViewController {
            self.present(newVC, animated: true, completion: nil)
            newVC.initNewIssueView(isNew: true, issue: nil)
        }
    }
    
    enum Section: Hashable {
        case main
    }
}

extension IssueListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let detailVC = self.storyboard?.instantiateViewController(identifier: IssueDetailViewController.reuseIdentifier) as? IssueDetailViewController {
            
            detailVC.sendIssueData(issue: issues[indexPath.row])
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}


//extension IssueListViewController: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return issues.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let detailVC = self.storyboard?.instantiateViewController(identifier: IssueDetailViewController.reuseIdentifier) as? IssueDetailViewController {
//            detailVC.sendIssueData(issue: issues[indexPath.row])
//            self.navigationController?.pushViewController(detailVC, animated: true)
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = issueListCollectionView.dequeueReusableCell(withReuseIdentifier: IssueListCollectionViewCell.reuseIdentifier, for: indexPath) as? IssueListCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        cell.delegate = self
//        cell.initIssueCell(issue: issues[indexPath.row])
//
//        return cell
//    }
//}
//
//extension IssueListViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = self.view.bounds.width
//        let height = CGFloat(130)
//
//        return CGSize(width: width, height: height)
//    }
//}
