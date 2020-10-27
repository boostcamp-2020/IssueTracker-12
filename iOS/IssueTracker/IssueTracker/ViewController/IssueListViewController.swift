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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    func configure() {
        issueListCollectionView.delegate = self
        issueListCollectionView.dataSource = self
        let cellNibName = UINib(nibName: IssueListCollectionViewCell.reuseIdentifier, bundle: nil)
        self.issueListCollectionView.register(cellNibName, forCellWithReuseIdentifier: IssueListCollectionViewCell.reuseIdentifier)
    }
    
}

extension IssueListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = issueListCollectionView.dequeueReusableCell(withReuseIdentifier: IssueListCollectionViewCell.reuseIdentifier, for: indexPath) as? IssueListCollectionViewCell else {
            return UICollectionViewCell()
        }
        //To Do : cell 설정
        return cell
    }
}

extension IssueListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width - (5 * 2)
        let height = CGFloat(120)
        
        return CGSize(width: width, height: height)
    }
}
