//
//  IsueeDetailViewController.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/10/27.
//

import UIKit
import FloatingPanel

protocol SendIssueDataDelegate {
    
    func sendIssueId(issueId: Int)
}

class IssueDetailViewController: UIViewController, FloatingPanelControllerDelegate {
    
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var openLabel: PaddedLabel!
    @IBOutlet weak var issueIDLabel: UILabel!
    
    @IBOutlet weak var commentTableView: UITableView!
    
    private var issue: Issue?
    private var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    private func configure() {
        commentTableView.delegate = self
        commentTableView.dataSource = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonDidTouch))
        NotificationCenter.default.addObserver(self, selector: #selector(reloadIssueData), name: .issueDidChange, object: nil)
    }
    
    private func initFloatingPanel(issueId: Int) {
        let attributeFloatingPanel = FloatingPanelController()
        attributeFloatingPanel.delegate = self
        attributeFloatingPanel.layout = MyFloatingPanelLayout()
        
        guard let attributeVC = storyboard?.instantiateViewController(identifier: IssueAttributeFloatingViewController.reuseIdentifier) as? IssueAttributeFloatingViewController
        else { return }
        attributeVC.getIssueData(issueId: issueId)
        attributeFloatingPanel.set(contentViewController: attributeVC)
        attributeFloatingPanel.addPanel(toParent: self)
    }
    
    class MyFloatingPanelLayout: FloatingPanelLayout {
        let position: FloatingPanelPosition = .bottom
        let initialState: FloatingPanelState = .tip
        var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
            return [
                .full: FloatingPanelLayoutAnchor(absoluteInset: 16.0, edge: .top, referenceGuide: .safeArea),
                .half: FloatingPanelLayoutAnchor(fractionalInset: 0.5, edge: .bottom, referenceGuide: .safeArea),
                .tip: FloatingPanelLayoutAnchor(absoluteInset: 90.0, edge: .bottom, referenceGuide: .safeArea)
            ]
        }
    }
    
    private func initCommentTableView(issueId: Int) {
        DispatchQueue.main.async {
            NetworkManager.shared.getRequest(url: .issue, urlAdd: "/\(issueId)/comment", type: CommentArray.self) { result in
                guard let comments = result?.commentArray else { return }
                self.comments = comments
                print(comments)
                self.commentTableView.reloadData()
            }
        }
    }
    
    private func setIssueData(issue: Issue) {
//        if let issue = issue {
            writerLabel.text = issue.writer
            titleLabel.text = issue.title
            issueIDLabel.text = "#\(issue.issueId)"
            openLabelConfigure(isOpen: issue.isOpen)
//        }
    }
    
    private func openLabelConfigure(isOpen: Int) {
        
        // * TO-DO :
        // - label 크기 따로 변수 선언
        // - 다른 화면에서도 사용할 수 있도록 Extension 빼기
        var openFlag = IssueOpen.open
        if isOpen == IssueOpen.closed.rawValue {
            openFlag = IssueOpen.closed
        }
        
        guard let iconImage = UIImage(named: openFlag.icon) else { return }
        guard let issueFont = openLabel.font else { return }
        
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = iconImage
        
        imageAttachment.bounds = CGRect(x: 0, y: issueFont.descender, width: 15, height: 15)
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: " \(openFlag.labelText)"))
        openLabel.attributedText = attributedString
        openLabel.textColor = UIColor(named: openFlag.color)
        openLabel.backgroundColor = UIColor(named: openFlag.backgroundColor)
    }
    
    @objc func reloadIssueData() {
        guard let issueId = issue?.issueId else { return }
        getIssueData(issueId: issueId)
        initCommentTableView(issueId: issueId)
    }
    
    private func getIssueData(issueId: Int) {
        DispatchQueue.main.async {
            NetworkManager.shared.getRequest(url: .issue, urlAdd: "/\(issueId)", type: OneIssue.self) { result in
                guard let issue = result?.issue else { return }
                self.issue = issue
                self.setIssueData(issue: issue)
                
            }
        }
    }
    
    @objc func editButtonDidTouch() {
        if let newVC = self.storyboard?.instantiateViewController(identifier: NewIssueViewController.reuseIdentifier) as? NewIssueViewController {
            self.present(newVC, animated: true, completion: nil)
            //issue 내용을 넘겨줘야함
            newVC.initNewIssueView(isNew: false, issue: issue)
        }
    }
    
}

extension IssueDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IssueDetailTableViewCell.reuseIdentifier, for: indexPath) as? IssueDetailTableViewCell else {
                    return UITableViewCell()
                }
        
        cell.setupView(comment: comments[indexPath.row])
        return cell
    }
}

extension IssueDetailViewController: UITableViewDelegate {
    
}

extension IssueDetailViewController: SendIssueDataDelegate {
    
    func sendIssueId(issueId: Int) {
        getIssueData(issueId: issueId)
        initFloatingPanel(issueId: issueId)
        initCommentTableView(issueId: issueId)
    }
}
