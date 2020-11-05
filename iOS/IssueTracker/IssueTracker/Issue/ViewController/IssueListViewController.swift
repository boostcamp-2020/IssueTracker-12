//
//  ViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/26.
//

import UIKit
import SwipeCellKit

class IssueListViewController: UIViewController {
    
    @IBOutlet weak var issueListSearchBar: UISearchBar!
    @IBOutlet weak var issueListCollectionView: UICollectionView!
    
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
        issueListCollectionView.delegate = self
        issueListCollectionView.dataSource = self
        let cellNibName = UINib(nibName: IssueListCollectionViewCell.reuseIdentifier, bundle: nil)
        self.issueListCollectionView.register(cellNibName, forCellWithReuseIdentifier: IssueListCollectionViewCell.reuseIdentifier)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadIssues), name: .issueDidChange, object: nil)
    }
    
    @objc func reloadIssues() {
        
        DispatchQueue.main.async {
            NetworkManager.shared.getRequest(url: .issue, type: IssueArray.self) { result in
                guard let issueArray = result else { return }
                self.issues = issueArray.issueArray
                self.issueListCollectionView.reloadData()
            }
        }
    }
    
    @IBAction func newIssueButtonDidTouch(_ sender: Any) {
        if let newVC = self.storyboard?.instantiateViewController(identifier: NewIssueViewController.reuseIdentifier) as? NewIssueViewController {
            self.present(newVC, animated: true, completion: nil)
            newVC.initNewIssueView(isNew: true, issue: nil)
        }
    }
    
}

// Cell Swipe image & action 처리
extension IssueListViewController: SwipeCollectionViewCellDelegate {
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // handle action by updating model with deletion
        }

        let closeAction = SwipeAction(style: .default, title: "Close") { (action, indexPath) in

        }
        closeAction.image = UIImage(named: "closed")?.withTintColor(UIColor.white)
        closeAction.backgroundColor = UIColor(named: "closeGreen")
        deleteAction.image = UIImage(named: "delete")?.withTintColor(UIColor.white)
        return [closeAction, deleteAction]
    }
}

extension IssueListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return issues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let detailVC = self.storyboard?.instantiateViewController(identifier: IssueDetailViewController.reuseIdentifier) as? IssueDetailViewController {
            detailVC.sendIssueData(issue: issues[indexPath.row])
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = issueListCollectionView.dequeueReusableCell(withReuseIdentifier: IssueListCollectionViewCell.reuseIdentifier, for: indexPath) as? IssueListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.initIssueCell(issue: issues[indexPath.row])
        
        return cell
    }
}

extension IssueListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width
        let height = CGFloat(130)
        
        return CGSize(width: width, height: height)
    }
}
