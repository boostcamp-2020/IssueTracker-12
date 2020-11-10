//
//  ViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/26.
//

import UIKit

class IssueListViewController: UIViewController {
    
    @IBOutlet weak var issueListSearchBar: UISearchBar!
    @IBOutlet weak var issueListCollectionView: UICollectionView!
    
    private var issues = [Issue]()
    private var isEditMode = false
    
    typealias IssueDataSource = UICollectionViewDiffableDataSource<Section, Issue>
    private lazy var dataSource = createDataSource()
    
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
//        issueListCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

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
                cell.accessories = [.multiselect(displayed: .whenEditing, options: .init()) ]
            return cell
        })
        return dataSource
    }
    
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.trailingSwipeActionsConfigurationProvider = { [unowned self] (indexPath) in
            
            var isOpen = IssueOpen.open
            if self.issues[indexPath.row].isOpen == IssueOpen.closed.rawValue {
                isOpen = IssueOpen.closed
            }
            let closeAction = UIContextualAction(style: .destructive, title: "\(isOpen.text)") {(_, _, completion) in
                
                let object = ["is_open": isOpen.param]
                NetworkManager.shared.patchRequest(
                    url: .issue,
                    updateID: self.issues[indexPath.row].issueId,
                    object: object, type: .isOpen) { _ in
                        NotificationCenter.default.post(name: .issueDidChange, object: nil)
                }
                completion(true)
            }
            
            closeAction.backgroundColor = UIColor(named: isOpen.color)
            closeAction.image = UIImage(named: isOpen.image)
            
            return UISwipeActionsConfiguration(actions: [closeAction])
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
                self.dataSource.apply(snapshot, animatingDifferences: false)
            }
        }
    }
    
    @IBAction func editButtonDidTouch(_ sender: UIBarButtonItem) {
        
        isEditMode = !isEditMode
        issueListCollectionView.isEditing = isEditMode
        
        issueListCollectionView.allowsMultipleSelectionDuringEditing = true
        issueListCollectionView.allowsSelection = true
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
