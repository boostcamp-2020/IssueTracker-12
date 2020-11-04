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
    
    private var milestones = [Milestone]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadMilestones()
    }
    
    private func configure() {
        milestoneCollectionView.delegate = self
        milestoneCollectionView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(reloadMilestones), name: .milestoneDidChange, object: nil)
    }
    
    @objc func reloadMilestones() {
        DispatchQueue.main.async {
            NetworkManager.shared.getRequest(url: .milestone, type: MilestoneArray.self) { result in
                guard let milestoneArray = result else { return }
                self.milestones = milestoneArray.milestoneArray
                self.milestoneCollectionView.reloadData()
            }
        }
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
        return milestones.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let editVC = self.storyboard?.instantiateViewController(identifier: MilestoneEditViewController.reuseIdentifier) as? MilestoneEditViewController {
            editVC.modalPresentationStyle = .overFullScreen
            editVC.modalTransitionStyle = .crossDissolve
            self.present(editVC, animated: true, completion: nil)
            editVC.initEditView(isNew: false, milestone: milestones[indexPath.row])
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = milestoneCollectionView.dequeueReusableCell(withReuseIdentifier: MilestoneCollectionViewCell.reuseIdentifier, for: indexPath) as? MilestoneCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.initMilestoneCell(milestone: milestones[indexPath.row])
        
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
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { (_, indexPath) in
            NetworkManager.shared.deleteRequest(url: .milestone, deleteID: self.milestones[indexPath.row].milestoneId) { nsDictionary in
                print(nsDictionary)
                NotificationCenter.default.post(name: .milestoneDidChange, object: nil)
            }
        }
        
        deleteAction.image = UIImage(named: "delete")?.withTintColor(UIColor.white)
        return [deleteAction]
    }
}
