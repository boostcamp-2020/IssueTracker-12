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
    
    private var tempString: String = ""
    private var isNew: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    @objc func markdownSegmentedControlValueChanged(segment: UISegmentedControl) {
        let parser = MarkdownParser(font: UIFont.systemFont(ofSize: 18))
        
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
    func initNewIssueView(isNew: Bool, issue: String?) {
        self.isNew = isNew
        if isNew {
            issueNumberLabel.text = "새 이슈"
        } else {
            // 이슈 내용으로 초기화
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
    
    @IBAction func cancelButtonDidTouch(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonDidTouch(_ sender: Any) {
    
    }
}

//issueContentTextView PlaceHolder 구현
extension NewIssueViewController: UITextViewDelegate {
    //textView 편집이 시작될 때
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
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
