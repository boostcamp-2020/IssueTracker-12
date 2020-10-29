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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonDidTouch(_ sender: Any) {
        dismiss(animated: true)
    }
   
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        titleTextField.text = ""
        completionDateTextField.text = ""
        descriptionTextField.text = ""
    }
    
    @IBAction func saveButtonDidTouch(_ sender: Any) {
    
    }
    
}
