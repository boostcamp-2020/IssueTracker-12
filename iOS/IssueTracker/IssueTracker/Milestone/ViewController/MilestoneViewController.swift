//
//  MilestoneViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/28.
//

import UIKit
import SwipeCellKit

class MilestoneViewController: UIViewController {
    
    @IBOutlet weak var milestoneCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        milestoneCollectionView.delegate = self
        milestoneCollectionView.dataSource = self
    }
    
    @IBAction func addButtonDidTouch(_ sender: Any) {
        if let editVC = self.storyboard?.instantiateViewController(identifier: MilestoneEditViewController.reuseIdentifier) as? MilestoneEditViewController {
            editVC.modalPresentationStyle = .overFullScreen
            editVC.modalTransitionStyle = .crossDissolve
            self.present(editVC, animated: true, completion: nil)
        }
    }
}

extension MilestoneViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let editVC = self.storyboard?.instantiateViewController(identifier: MilestoneEditViewController.reuseIdentifier) as? MilestoneEditViewController {
            editVC.modalPresentationStyle = .overFullScreen
            editVC.modalTransitionStyle = .crossDissolve
            self.present(editVC, animated: true, completion: nil)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = milestoneCollectionView.dequeueReusableCell(withReuseIdentifier: MilestoneCollectionViewCell.reuseIdentifier, for: indexPath) as? MilestoneCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        
        return cell
    }
}

extension MilestoneViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width - (5 * 2)
        let height = CGFloat(100)
        
        return CGSize(width: width, height: height)
    }
}

extension MilestoneViewController: SwipeCollectionViewCellDelegate {
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // handle action by updating model with deletion

        }
        deleteAction.image = UIImage(named: "delete")?.withTintColor(UIColor.white)
        return [deleteAction]
    }
}
