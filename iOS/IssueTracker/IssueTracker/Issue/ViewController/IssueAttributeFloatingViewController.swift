//
//  IssueAttributeFloatingViewController.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/10/28.
//

import UIKit

class IssueAttributeFloatingViewController: UIViewController {

    @IBOutlet weak var labelScrollView: UIScrollView!
    @IBOutlet weak var assigneeCollectionView: UICollectionView!
    @IBOutlet weak var milestionTitleLabel: PaddedLabel!
    @IBOutlet weak var closeIssueButton: UIButton!
    @IBOutlet weak var milestoneProgressView: UIProgressView!
    
    private var issue: Issue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assigneeCollectionView.dataSource = self
        assigneeCollectionView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(reloadIssueData), name: .issueDidChange, object: nil)
    }
    
    private func reloadView() {
        DispatchQueue.main.async { [weak self] in
            guard let issue = self?.issue else { return }
            
            if let milestoneTitle = issue.milestoneTitle {
                self?.milestionTitleLabel.text = milestoneTitle
                
            }
            self?.labelsConfigure(labels: issue.labels)
            self?.assigneeCollectionView.reloadData()
            if issue.isOpen == 0 {
                self?.closeIssueButton.setTitle("Open Issue", for: .normal)
                self?.closeIssueButton.setTitleColor(UIColor.green, for: .normal)
            }
        }
    }
    
    private func labelsConfigure(labels: [Label]) {
        var xPosition: CGFloat = 0
        labels.forEach { label in
            let newLabel = PaddedLabel()
            newLabel.text = label.labelName
            newLabel.backgroundColor = UIColor(hex: label.color)
            newLabel.textAlignment = .center
            newLabel.paddingWidth = 14
            newLabel.paddingHeight = 10
            newLabel.cornerRadius = 10
            let labelWidth = newLabel.intrinsicContentSize.width
            
            newLabel.frame = CGRect(x: xPosition, y: 0, width: labelWidth, height: 20)
            
            xPosition += (labelWidth + 6)
            labelScrollView.addSubview(newLabel)
            labelScrollView.contentSize.width = xPosition
        }
    }
    
    func getIssueData(issueId: Int) {
        DispatchQueue.main.async {
            NetworkManager.shared.getRequest(url: .issue, urlAdd: "/\(issueId)", type: OneIssue.self) { result in
                guard let issue = result?.issue else { return }
                self.issue = issue
                self.reloadView()
            }
        }
    }
    
    @objc func reloadIssueData() {
        guard let issueId = issue?.issueId else { return }
        getIssueData(issueId: issueId)
    }
    
    @IBAction func assigneeSelectButtondidTouch(_ sender: Any) {
        if let selectVC = self.storyboard?.instantiateViewController(identifier: IssueAssigneeSelectViewController.reuseIdentifier) as? IssueAssigneeSelectViewController {
            
            selectVC.modalPresentationStyle = .currentContext
            selectVC.issue = self.issue
            self.present(selectVC, animated: true, completion: nil)
        }
    }
    @IBAction func labelSelectButtonDidTouch(_ sender: Any) {
        if let selectVC = self.storyboard?.instantiateViewController(identifier: IssueLabelSelectViewController.reuseIdentifier) as? IssueLabelSelectViewController {
            
            selectVC.modalPresentationStyle = .currentContext
            selectVC.issue = self.issue
            self.present(selectVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func milestoneSelectButtonDidTouch(_ sender: Any) {
        if let selectVC = self.storyboard?.instantiateViewController(identifier: IssueMilestoneSelectViewController.reuseIdentifier) as? IssueMilestoneSelectViewController {
            
            selectVC.modalPresentationStyle = .currentContext
            selectVC.issue = self.issue
            self.present(selectVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func closeIssueButtonDidTouch(_ sender: Any) {
        guard let issue = issue else { return }
        let isOpen = (issue.isOpen != 0)
        let object = ["is_open": !isOpen]
        NetworkManager.shared.patchRequest(
            url: .issue,
            updateID: issue.issueId,
            object: object, type: .isOpen) { _ in
                NotificationCenter.default.post(name: .issueDidChange, object: nil)
        }
    }
    
    @IBAction func addCommentButtonDidTouch(_ sender: Any) {
        guard let issueId = issue?.issueId else { return }
        if let selectVC = self.storyboard?.instantiateViewController(identifier: CommentViewController.reuseIdentifier) as? CommentViewController {
            
            //selectVC.modalPresentationStyle = 
            selectVC.setIssueId(issueId: issueId)
            self.present(selectVC, animated: true, completion: nil)
        }
    }
}

extension IssueAttributeFloatingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return issue?.assignee.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AssigneeCollectionViewCell.reuseIdentifier, for: indexPath) as? AssigneeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.assigneeImageView.image = UIImage(named: "cat")
        cell.assigneeNameLabel.text = issue?.assignee[indexPath.row].userName ?? "None"
        return cell
    }
    
}

extension IssueAttributeFloatingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
    }
}
