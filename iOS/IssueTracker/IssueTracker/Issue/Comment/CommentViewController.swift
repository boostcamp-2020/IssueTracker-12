//
//  CommentViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/12.
//

import UIKit
import MarkdownKit

class CommentViewController: UIViewController {

    @IBOutlet weak var markdownSegmentedControl: UISegmentedControl!
    @IBOutlet weak var commentTextView: UITextView!
    private var tempString: String = ""
    private var issueId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        commentTextView.delegate = self
        commentTextView.text = "코멘트는 여기에 작성하세요"
        commentTextView.textColor = .lightGray
        commentTextView.clearsContextBeforeDrawing = true
        markdownSegmentedControl.addTarget(self, action: #selector(markdownSegmentedControlValueChanged), for: .valueChanged)
    }
    func setIssueId(issueId: Int) {
        self.issueId = issueId
    }
    
    @objc func markdownSegmentedControlValueChanged(segment: UISegmentedControl) {
        let parser = MarkdownParser(font: UIFont.systemFont(ofSize: 17))
        
        switch segment.selectedSegmentIndex {
        case 0:
            commentTextView.isEditable = true
            removeAttribute()
            commentTextView.text = tempString
        case 1:
            tempString = commentTextView.text
            commentTextView.attributedText = parser.parse(tempString)
            commentTextView.isEditable = false
        default: return
        }
    }
    
    private func removeAttribute() {
        let font = UIFont.systemFont(ofSize: 17)
        let attributes = [NSAttributedString.Key.font: font]
        let removedAttributeString = NSMutableAttributedString(string: "remove attribute", attributes: attributes)
        commentTextView.attributedText = removedAttributeString
    }
    
    @IBAction func cancelButtonDidTouch(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonDidChange(_ sender: Any) {
        guard let writerId = UserDefaults.standard.object(forKey: "userID") as? Int else { return }
        let date = Date()
        let comment = NewComment(writerID: writerId, contents: commentTextView.text, isIssueContent: false, date: date)
        NetworkManager.shared.postRequest(url: URL(string: "\(URLs.issue.rawValue)/\(issueId)/comment")!
                                          , object: comment, type: NewComment.self) { result in
            print(result)
            NotificationCenter.default.post(name: .issueDidChange, object: nil)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}

extension CommentViewController: UITextViewDelegate {
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
