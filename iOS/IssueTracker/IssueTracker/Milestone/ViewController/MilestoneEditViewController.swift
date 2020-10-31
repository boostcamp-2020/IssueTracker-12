//
//  MilestoneEditViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/29.
//

import UIKit

class MilestoneEditViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var completionDateTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var completionDateLabel: UILabel!
    
    private var isNew: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        completionDateTextField.addTarget(self, action: #selector(dateValidation), for: .editingChanged)
    }
    
    //milestone을 정보를 받아오는 곳
    func initEditView(isNew: Bool, milestone: String?) {
        self.isNew = isNew
        // milestone정보로 세팅
    }
    
    @objc func dateValidation() {
        guard let date = completionDateTextField.text else { return }
        if !date.isDate() {
            DispatchQueue.main.async { [weak self] in
                self?.completionDateLabel.textColor = UIColor.red
            }
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.completionDateLabel.textColor = UIColor.label
            }
        }
        
    }
    
    @IBAction func closeButtonDidTouch(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        if isNew {
            titleTextField.text = ""
            completionDateTextField.text = ""
            descriptionTextField.text = ""
        } else {
            // 처음 받아온 milestone정보로 reset
        }
    }
    
    @IBAction func saveButtonDidTouch(_ sender: Any) {
        
    }
    
}
