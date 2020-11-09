//
//  MilestoneEditViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/29.
//

import UIKit

class MilestoneEditViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var dueDateLabel: UILabel!
    
    private var isNew: Bool = true
    private var milestone: Milestone?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        dueDateTextField.addTarget(self, action: #selector(dateValidation), for: .editingChanged)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func initEditView(isNew: Bool, milestone: Milestone?) {
        self.isNew = isNew
        if isNew {
            DispatchQueue.main.async { [weak self] in
                self?.titleTextField.text = ""
                self?.dueDateTextField.text = ""
                self?.contentTextField.text = ""
            }
        } else {
            self.milestone = milestone
            DispatchQueue.main.async { [weak self] in
                self?.titleTextField.text = milestone?.title
                self?.dueDateTextField.text = milestone?.dueDate
                self?.contentTextField.text = milestone?.content
            }
        }
    }
    
    @objc func dateValidation() {
        guard let date = dueDateTextField.text else { return }
        if !date.isDate() {
            DispatchQueue.main.async { [weak self] in
                self?.dueDateLabel.textColor = UIColor.red
            }
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.dueDateLabel.textColor = UIColor.label
            }
        }
    }
    
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        initEditView(isNew: isNew, milestone: self.milestone)
    }
    
    @IBAction func saveButtonDidTouch(_ sender: Any) {
        guard let title = titleTextField.text,
              let dueDate = dueDateTextField.text,
              let content = contentTextField.text else { return }
        
        if !dueDate.isDate() {
            print("날짜가 올바르지 않습니다.") //toast같은걸 써서 표시?
            return
        }
        
        if isNew {
            newMilestoneSave(milestone: Milestone(title: title, dueDate: dueDate, content: content))
        } else {
            milestone?.title = title
            milestone?.dueDate = dueDate
            milestone?.content = content
            if let milestone = milestone {
                editMilesoneSave(milestone: milestone)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    private func newMilestoneSave(milestone: Milestone) {
        NetworkManager.shared.postRequest(url: .milestone, object: milestone, type: Milestone.self) { nsDictionary in
            print(nsDictionary)
            NotificationCenter.default.post(name: .milestoneDidChange, object: nil)
        }
    }
    
    private func editMilesoneSave(milestone: Milestone) {
        NetworkManager.shared.putRequest(url: .milestone, updateID: milestone.milestoneId, object: milestone, type: Milestone.self) { nsDictionary in
            print(nsDictionary)
            NotificationCenter.default.post(name: .milestoneDidChange, object: nil)
        }
    }
    
    @IBAction func closeButtonDidTouch(_ sender: Any) {
        dismiss(animated: true)
    }
}
