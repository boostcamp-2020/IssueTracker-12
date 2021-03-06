//
//  NewIssueViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/02.
//

import UIKit
import MarkdownKit

class NewIssueViewController: UIViewController {

    @IBOutlet weak var issueNumberLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var issueContentTextView: UITextView!
    @IBOutlet weak var markdownSegmentedControl: UISegmentedControl!
    
    private var issue: Issue?
    private var comment: Comment?
    private var isNew: Bool = true
    private var tempString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @objc func markdownSegmentedControlValueChanged(segment: UISegmentedControl) {
        let parser = MarkdownParser(font: UIFont.systemFont(ofSize: 17))
        
        switch segment.selectedSegmentIndex {
        case 0:
            issueContentTextView.isEditable = true
            removeAttribute()
            issueContentTextView.text = tempString
        case 1:
            tempString = issueContentTextView.text
            issueContentTextView.attributedText = parser.parse(tempString)
            issueContentTextView.isEditable = false
        default: return
        }
    }
    
    // issue 내용으로 초기화
    func initNewIssueView(isNew: Bool, issue: Issue?, comment: Comment?) {
        self.isNew = isNew
        if isNew {
            issueNumberLabel.text = "새 이슈"
        } else {
            self.issue = issue
            self.comment = comment
            DispatchQueue.main.async { [weak self] in
                self?.issueNumberLabel.text = "#\(issue!.issueId)"
                self?.titleTextField.text = issue?.title
                self?.issueContentTextView.text = comment?.contents
            }
        }
    }
    
    // issueContentTextView의 text attribute를 제거
    private func removeAttribute() {
        let font = UIFont.systemFont(ofSize: 17)
        let attributes = [NSAttributedString.Key.font: font]
        let removedAttributeString = NSMutableAttributedString(string: "remove attribute", attributes: attributes)
        issueContentTextView.attributedText = removedAttributeString
    }
    
    private func configure() {
        issueContentTextView.delegate = self
        issueContentTextView.text = "코멘트는 여기에 작성하세요"
        issueContentTextView.textColor = .lightGray
        issueContentTextView.clearsContextBeforeDrawing = true
        markdownSegmentedControl.addTarget(self, action: #selector(markdownSegmentedControlValueChanged), for: .valueChanged)
    }
    
    @IBAction func cancelButtonDidTouch(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonDidTouch(_ sender: UIButton) {
    
        guard let title = titleTextField.text,
              let contents = issueContentTextView.text else { return }
        
        if isNew {
            let date = Date()
            
            guard let writer = UserDefaults.standard.object(forKey: "userName") as? String,
                  let writerId = UserDefaults.standard.object(forKey: "userID") as? Int else { return }
            let issue = NewIssue(title: title, writer: writer, date: date)
            let comment = NewComment(writerID: writerId, contents: contents, isIssueContent: true, date: date)
            newIssueSave(issue: issue, comment: comment)
        } else {
            editIssueSave(title: title, contents: contents)
        }
        
        dismiss(animated: true)
    }
    
    private func newIssueSave(issue: NewIssue, comment: NewComment) {
        
        guard let issueURL = URL(string: URLs.issue.rawValue) else { return }
        NetworkManager.shared.postRequest(url: issueURL, object: issue, type: NewIssue.self) { result in
            guard let response = result else { return }
            let issueId = response.insertId
            
            guard let commentURL = URL(string: "\(URLs.issue.rawValue)/\(issueId)/comment") else { return }
            NetworkManager.shared.postRequest(url: commentURL, object: comment, type: NewComment.self) { _ in
                
                NotificationCenter.default.post(name: .issueDidChange, object: nil)
            }
        }
    }
    
    private func editIssueSave(title: String, contents: String) {
        
        let object = ["title": title]
        guard let issueId = issue?.issueId else { return }
        guard let issueURL = URL(string: "\(URLs.issue.rawValue)/\(issueId)/title") else { return }
        NetworkManager.shared.patchRequest(
            url: issueURL,
            updateID: issueId,
            object: object) { _ in
                NotificationCenter.default.post(name: .issueDidChange, object: nil)
        }
        
        let commentObject = ["content": contents]
        guard let commentId = comment?.commentID else { return }
        guard let commentURL = URL(string: "\(URLs.issue.rawValue)/\(issueId)/comment/\(commentId)") else { return }
        NetworkManager.shared.patchRequest(
            url: commentURL,
            updateID: issueId,
            object: commentObject) { _ in
                NotificationCenter.default.post(name: .issueDidChange, object: nil)
        }
    }
}

//issueContentTextView PlaceHolder 구현
extension NewIssueViewController: UITextViewDelegate {
    //textView 편집이 시작될 때
    func textViewDidBeginEditing(_ textView: UITextView) {
        if isNew, textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = .black
        } else if !isNew {
            textView.textColor = .black
        }
    }
    //textView 아무것도 안쓰고 편집이 종료될 때
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "코멘트는 여기에 작성하세요"
            textView.textColor = .lightGray
        }
    }
}
