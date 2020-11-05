//
//  IsueeDetailViewController.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/10/27.
//

import UIKit
import FloatingPanel

protocol SendIssueDataDelegate {
    
    func sendIssueData(issue: Issue)
}

class IssueDetailViewController: UIViewController, FloatingPanelControllerDelegate {
    
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var openLabel: PaddedLabel!
    @IBOutlet weak var issueIDLabel: UILabel!
    
    @IBOutlet weak var commentTableView: UITableView!
    
    private var issue: Issue?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        
        let attributeFloatingPanel = FloatingPanelController()
        attributeFloatingPanel.delegate = self
        
        guard let attributeVC = storyboard?.instantiateViewController(identifier: IssueAttributeFloatingViewController.reuseIdentifier) as? IssueAttributeFloatingViewController
        else { return }
        attributeFloatingPanel.set(contentViewController: attributeVC)
        attributeFloatingPanel.addPanel(toParent: self)
        
        commentTableView.delegate = self
        commentTableView.dataSource = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonDidTouch))
        
        setIssueData()
        
    }
    
    private func setIssueData() {
        
        if let issue = issue {
            writerLabel.text = issue.writer
            titleLabel.text = issue.title
            issueIDLabel.text = "#\(issue.issueId)"
        }
    }
    
    @objc func editButtonDidTouch() {
        if let newVC = self.storyboard?.instantiateViewController(identifier: NewIssueViewController.reuseIdentifier) as? NewIssueViewController {
            self.present(newVC, animated: true, completion: nil)
            //issue 내용을 넘겨줘야함
            newVC.initNewIssueView(isNew: false, issue: nil)
        }
    }
    
}

extension IssueDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IssueDetailTableViewCell.reuseIdentifier, for: indexPath) as? IssueDetailTableViewCell else {
                    return UITableViewCell()
                }
        
        cell.setupView()
        return cell
    }
}

extension IssueDetailViewController: UITableViewDelegate {
    
}

extension IssueDetailViewController: SendIssueDataDelegate {
    
    func sendIssueData(issue: Issue) {
        
        self.issue = issue
//        writerLabel.text = issue.writer
//        titleLabel.text = issue.title
//        issueIDLabel.text = "#\(issue.issueId)"
    }
}
