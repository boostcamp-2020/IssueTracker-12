//
//  IssueAttributeFloatingViewController.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/10/28.
//

import UIKit

class IssueAttributeFloatingViewController: UIViewController {

    @IBOutlet weak var labelScrollView: UIScrollView!
    @IBOutlet weak var assigneeScrollView: UIScrollView!
    private var issue: Issue?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setIssue(issue: Issue?) {
        self.issue = issue
        DispatchQueue.main.async { [weak self] in
            guard let issue = issue else { return }
            self?.labelsConfigure(labels: issue.labels)
        }
    }
    
    private func assigneeConfigure(assignees: [User]) {
        var xPosition: CGFloat = 0
        assignees.forEach { assignee in
            let newAssignee = AssigneeView()
            newAssignee.nameLabel.text = assignee.userName
            newAssignee.profileImageView.image = UIImage(named: "cat")
            
            let assigneeWidth = newAssignee.intrinsicContentSize.width
            newAssignee.frame = CGRect(x: xPosition, y: 0, width: assigneeWidth, height: 75)
            xPosition += (assigneeWidth + 5)
            assigneeScrollView.addSubview(newAssignee)
            assigneeScrollView.contentSize.width = xPosition
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
}
