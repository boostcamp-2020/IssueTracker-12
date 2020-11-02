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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        issueContentTextViewConfigure()
    }
    
    func issueContentTextViewConfigure() {
        issueContentTextView.delegate = self
        issueContentTextView.text = "코멘트는 여기에 작성하세요"
        issueContentTextView.textColor = .lightGray
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
    //textView 편집이 종료될 때
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "코멘트는 여기에 작성하세요"
            textView.textColor = .lightGray
        }
    }
}
