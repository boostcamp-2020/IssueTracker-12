//
//  LabelViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/29.
//

import UIKit

class LabelViewController: UIViewController {
    
    @IBOutlet weak var labelCollectionView: UICollectionView!
    
    typealias LabelDataSource = UICollectionViewDiffableDataSource<Section, Label>
    private var labels = [Label]()
    private lazy var dataSource = createDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadLabels()
    }
    
    private func configure() {
        labelCollectionView.collectionViewLayout = createCollectionViewLayout()
        labelCollectionView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(reloadLabels), name: .labelDidChange, object: nil)
    }
    
    private func createDataSource() -> LabelDataSource {
        let dataSource = LabelDataSource(
            collectionView: labelCollectionView,
            cellProvider: { (collectionView, indexPath, label) -> UICollectionViewCell? in
                
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.reuseIdentifier, for: indexPath)
                    as? LabelCollectionViewCell else { return UICollectionViewCell() }
            cell.initLabelCell(label: label)
            
            return cell
        })
        return dataSource
    }
    
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.trailingSwipeActionsConfigurationProvider = { [unowned self] (indexPath) in
            
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {(_, _, completion) in
                NetworkManager.shared.deleteRequest(
                    url: .label,
                    deleteID: self.labels[indexPath.row].labelId) { _ in
                    
                    NotificationCenter.default.post(name: .labelDidChange, object: nil)
                }
                completion(true)
            }
            deleteAction.image = UIImage(named: "delete")?.withTintColor(UIColor.white)
            
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
        
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
    
    @objc func reloadLabels() {
        
        DispatchQueue.main.async {
            NetworkManager.shared.getRequest(url: .label, type: LabelArray.self) { result in
                guard let labelArray = result else { return }
                self.labels = labelArray.labelArray
                var snapshot = NSDiffableDataSourceSnapshot<Section, Label>()
                snapshot.appendSections([.main])
                snapshot.appendItems(self.labels)
                self.dataSource.apply(snapshot)
            }
        }
    }
    
    @IBAction func addButtonDidTouch(_ sender: UIButton) {
        
        if let editVC = self.storyboard?.instantiateViewController(identifier: LabelEditViewController.reuseIdentifier) as? LabelEditViewController {
            
            editVC.modalPresentationStyle = .overFullScreen
            editVC.modalTransitionStyle = .crossDissolve
            editVC.initEditView(isNew: true, label: nil)
            self.present(editVC, animated: true, completion: nil)
        }
    }
    
    enum Section: Hashable {
        case main
    }
}

extension LabelViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let editVC = self.storyboard?.instantiateViewController(identifier: LabelEditViewController.reuseIdentifier)
            as? LabelEditViewController {
            
            editVC.modalPresentationStyle = .overFullScreen
            editVC.modalTransitionStyle = .crossDissolve
            self.present(editVC, animated: true, completion: nil)
            editVC.initEditView(isNew: false, label: labels[indexPath.row])
        }
    }
}
