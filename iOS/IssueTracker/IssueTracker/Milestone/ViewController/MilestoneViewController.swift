//
//  MilestoneViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/28.
//

import UIKit

class MilestoneViewController: UIViewController {
    
    @IBOutlet weak var milestoneCollectionView: UICollectionView!
    
    typealias MilestoneDataSource = UICollectionViewDiffableDataSource<Section, Milestone>
    private var milestones = [Milestone]()
    private lazy var dataSource = createDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadMilestones()
    }
    
    private func configure() {
        milestoneCollectionView.collectionViewLayout = createCollectionViewLayout()
        milestoneCollectionView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(reloadMilestones), name: .milestoneDidChange, object: nil)
    }
    
    private func createDataSource() -> MilestoneDataSource {
        let dataSource = MilestoneDataSource(
            collectionView: milestoneCollectionView,
            cellProvider: { (collectionView, indexPath, milestone) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MilestoneCollectionViewCell.reuseIdentifier, for: indexPath)
                    as? MilestoneCollectionViewCell else { return UICollectionViewCell() }
            cell.initMilestoneCell(milestone: milestone)
            
            return cell
        })
        return dataSource
    }
    
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.trailingSwipeActionsConfigurationProvider = { [unowned self] (indexPath) in
            
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {(_, _, completion) in
                NetworkManager.shared.deleteRequest(
                    url: .milestone,
                    deleteID: self.milestones[indexPath.row].milestoneId) { _ in
                    
                    NotificationCenter.default.post(name: .milestoneDidChange, object: nil)
                }
                completion(true)
            }
            deleteAction.image = UIImage(named: "delete")?.withTintColor(UIColor.white)
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
        
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
    
    @objc func reloadMilestones() {
        DispatchQueue.main.async {
            NetworkManager.shared.getRequest(url: .milestone, type: MilestoneArray.self) { result in
                guard let milestoneArray = result else { return }
                self.milestones = milestoneArray.milestoneArray
                var snapshot = NSDiffableDataSourceSnapshot<Section, Milestone>()
                snapshot.appendSections([.main])
                snapshot.appendItems(self.milestones)
                self.dataSource.apply(snapshot)
            }
        }
    }
    
    @IBAction func addButtonDidTouch(_ sender: UIButton) {
        
        if let editVC = self.storyboard?.instantiateViewController(identifier: MilestoneEditViewController.reuseIdentifier)
            as? MilestoneEditViewController {
            editVC.modalPresentationStyle = .overFullScreen
            editVC.modalTransitionStyle = .crossDissolve
            self.present(editVC, animated: true, completion: nil)
        }
    }
    
    enum Section: Hashable {
        case main
    }
}

extension MilestoneViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let editVC = self.storyboard?.instantiateViewController(identifier: MilestoneEditViewController.reuseIdentifier)
            as? MilestoneEditViewController {
            editVC.modalPresentationStyle = .overFullScreen
            editVC.modalTransitionStyle = .crossDissolve
            self.present(editVC, animated: true, completion: nil)
            editVC.initEditView(isNew: false, milestone: milestones[indexPath.row])
        }
    }
}
