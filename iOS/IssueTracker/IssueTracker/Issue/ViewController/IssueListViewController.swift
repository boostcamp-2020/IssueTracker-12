//
//  ViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/26.
//

import UIKit

class IssueListViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newIssueButton: UIButton!
    @IBOutlet weak var issueCloseButton: UIBarButtonItem!
    @IBOutlet weak var issueListSearchBar: UISearchBar!
    @IBOutlet weak var issueListCollectionView: UICollectionView!
    
    private var issues = [Issue]()
    private var isEditMode = false
    private var isSelectAll = false
    
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
        
        tabBarController?.tabBar.isHidden = false
        issueListCollectionView.collectionViewLayout = createCollectionViewLayout()
        issueListCollectionView.delegate = self
        issueListSearchBar.delegate = self
        
        let cellNibName = UINib(nibName: IssueListCollectionViewCell.reuseIdentifier, bundle: nil)
        self.issueListCollectionView.register(cellNibName, forCellWithReuseIdentifier: IssueListCollectionViewCell.reuseIdentifier)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadIssues), name: .issueDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applyFilters), name: .issueFilterDidChange, object: nil)
        
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
            var isOpen = IssueOpen.closed
            
            if dataSource.itemIdentifier(for: indexPath)?.isOpen == IssueOpen.closed.rawValue {
                isOpen = IssueOpen.open
            }
            let closeAction = UIContextualAction(style: .destructive, title: "\(isOpen.text)") {(_, _, completion) in
                
                closeIssue(isOpen: isOpen, indexPath: indexPath)
                completion(true)
            }
            
            closeAction.backgroundColor = UIColor(named: isOpen.color)
            closeAction.image = UIImage(named: isOpen.image)
            
            return UISwipeActionsConfiguration(actions: [closeAction])
        }
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
    
    private func applySnapshot(issues: [Issue]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Issue>()
        snapshot.appendSections([.main])
        snapshot.appendItems(issues)
        self.dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    @objc func reloadIssues() {
        
        DispatchQueue.main.async { [weak self] in
            NetworkManager.shared.getRequest(url: .issue, type: IssueArray.self) { result in
                guard let issueArray = result else { return }
                self?.issues = issueArray.issueArray
                self?.applySnapshot(issues: self?.issues ?? [])
                
            }
        }
    }
    
    @objc func applyFilters(_ notification: Notification) {
        guard let mainFilters = notification.userInfo?["mainFilters"] as? [Filterable],
              let detailFilters = notification.userInfo?["detailFilters"] as? [Filterable] else { return }
        let mainOrCriteria = OrCriteria(criterias: mainFilters)
        let detailOrCriteria = OrCriteria(criterias: detailFilters)
        let totalCriteria = AndCriteria(criterias: [mainOrCriteria, detailOrCriteria])
        DispatchQueue.main.async { [weak self] in
            self?.applySnapshot(issues: totalCriteria.apply(issues: self?.issues ?? []))
        }
        
    }
    
    @IBAction func rightBarButtonDidTouch(_ sender: UIBarButtonItem) {
        
        isEditMode = !isEditMode
        issueListCollectionView.isEditing = isEditMode
        
        if isEditMode {
            setupEditView()
        } else {
            setupIssueListView()
        }
    }
    
    @IBAction func leftBarButtonDidTouch(_ sender: UIBarButtonItem) {
        
        if isEditMode {
            if isSelectAll {
                deselectAllItems()
            } else {
                selectAllItems()
            }
        } else {
            if let filterVC = self.storyboard?.instantiateViewController(identifier: IssueFilterViewController.reuseIdentifier) as? IssueFilterViewController {
                self.present(filterVC, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func issueCloseButtonDidTouch(_ sender: UIBarButtonItem) {
        
        isSelectAll = false
        titleLabel.text = "0개 선택"
        issueListCollectionView.indexPathsForSelectedItems?.forEach { indexPath in
            closeIssue(isOpen: IssueOpen.closed, indexPath: indexPath)
        }
    }
    
    @IBAction func newIssueButtonDidTouch(_ sender: UIButton) {
        if let newVC = self.storyboard?.instantiateViewController(identifier: NewIssueViewController.reuseIdentifier) as? NewIssueViewController {
            self.present(newVC, animated: true, completion: nil)
            newVC.initNewIssueView(isNew: true, issue: nil)
        }
    }
    
    private func closeIssue(isOpen: IssueOpen, indexPath: IndexPath) {
        guard let issue = dataSource.itemIdentifier(for: indexPath) else { return }
        let object = ["is_open": isOpen.param]
        NetworkManager.shared.patchRequest(
            url: .issue,
            updateID: issue.issueId,
            object: object, type: .isOpen) { _ in
                NotificationCenter.default.post(name: .issueDidChange, object: nil)
        }
    }
    
    private func setupIssueListView() {
        
        tabBarController?.tabBar.isHidden = false
        newIssueButton.isHidden = false
        titleLabel.text = "이슈"
        navigationItem.rightBarButtonItem?.title = "Edit"
        navigationItem.leftBarButtonItem?.title = "Filter"
    }
    
    private func setupEditView() {
        
        tabBarController?.tabBar.isHidden = true
        newIssueButton.isHidden = true
        titleLabel.text = "0개 선택"
        navigationItem.rightBarButtonItem?.title = "Cancel"
        navigationItem.leftBarButtonItem?.title = "Select All"
        issueListCollectionView.allowsMultipleSelectionDuringEditing = true
        issueListCollectionView.allowsSelection = true
    }
    
    private func selectAllItems() {
        
        isSelectAll = true
        let numberOfItems = issueListCollectionView.numberOfItems(inSection: 0)
        navigationItem.leftBarButtonItem?.title = "Deselect All"
        titleLabel.text = "\(numberOfItems)개 선택"
        for index in 0..<numberOfItems {
            issueListCollectionView.selectItem(at: IndexPath(item: index, section: 0), animated: false, scrollPosition: [])
        }
    }
    
    private func deselectAllItems() {
        
        isSelectAll = false
        navigationItem.leftBarButtonItem?.title = "Select All"
        titleLabel.text = "0개 선택"
        let numberOfItems = issueListCollectionView.numberOfItems(inSection: 0)
        for index in 0..<numberOfItems {
            issueListCollectionView.deselectItem(at: IndexPath(item: index, section: 0), animated: false)
        }
    }
    
    enum Section: Hashable {
        case main
    }
}

extension IssueListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let issue = dataSource.itemIdentifier(for: indexPath) else { return }
        if isEditMode {
            isSelectAll = false
            if issueListCollectionView.indexPathsForSelectedItems?.count == issueListCollectionView.numberOfItems(inSection: 0) {
                navigationItem.leftBarButtonItem?.title = "Deselect All"
                isSelectAll = true
            }
            titleLabel.text = "\(self.issueListCollectionView.indexPathsForSelectedItems?.count ?? 0)개 선택"
        } else {
            if let detailVC = self.storyboard?.instantiateViewController(identifier: IssueDetailViewController.reuseIdentifier) as? IssueDetailViewController {
                
                detailVC.sendIssueId(issueId: issue.issueId)
                self.navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if isEditMode {
            isSelectAll = false
            navigationItem.leftBarButtonItem?.title = "Select All"
            titleLabel.text = "\(self.issueListCollectionView.indexPathsForSelectedItems?.count ?? 0)개 선택"
        }
    }
}

extension IssueListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let filter = TitleCriteria(input: searchText)
        DispatchQueue.main.async { [weak self] in
            self?.applySnapshot(issues: filter.apply(issues: self?.issues ?? []))
        }
    }
}
