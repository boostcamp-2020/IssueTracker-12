//
//  LabelViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/29.
//

import UIKit
import SwipeCellKit

class LabelViewController: UIViewController {
    
    @IBOutlet weak var labelCollectionView: UICollectionView!
    
    private var labels = [Label]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NetworkManager.shared.getJSON(url: .label, type: LabelArray.self) { result in
            guard let labelArray = result else { return }
            self.labels = labelArray.labelArray
            self.labelCollectionView.reloadData()
        }
    }
    
    private func configure() {
        labelCollectionView.delegate = self
        labelCollectionView.dataSource = self
    }
    
    @IBAction func addButtonDidTouch(_ sender: Any) {
        if let editVC = self.storyboard?.instantiateViewController(identifier: LabelEditViewController.reuseIdentifier) as? LabelEditViewController {
            editVC.modalPresentationStyle = .overFullScreen
            editVC.modalTransitionStyle = .crossDissolve
            editVC.initEditView(isNew: true, label: nil)
            self.present(editVC, animated: true, completion: nil)
        }
    }
}

extension LabelViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let editVC = self.storyboard?.instantiateViewController(identifier: LabelEditViewController.reuseIdentifier) as? LabelEditViewController {
            editVC.modalPresentationStyle = .overFullScreen
            editVC.modalTransitionStyle = .crossDissolve
            self.present(editVC, animated: true, completion: nil)
            editVC.initEditView(isNew: false, label: labels[indexPath.row])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = labelCollectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.reuseIdentifier, for: indexPath) as? LabelCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.initLabelCell(label: labels[indexPath.row])

        return cell
    }
}

extension LabelViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width - (5 * 2)
        let height = CGFloat(100)
        
        return CGSize(width: width, height: height)
    }
}

extension LabelViewController: SwipeCollectionViewCellDelegate {
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // handle action by updating model with deletion
            
        }
        deleteAction.image = UIImage(named: "delete")?.withTintColor(UIColor.white)
        return [deleteAction]
    }
}
