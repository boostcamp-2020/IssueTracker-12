//
//  LabelEditViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/29.
//

import UIKit

class LabelEditViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var labelPreviewLabel: PaddedLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        titleTextField.text = ""
        descriptionTextField.text = ""
        colorTextField.text = ""
    }
    @IBAction func randomColorButtonDidTouch(_ sender: Any) {
    
    }
    @IBAction func saveButtonDidTouch(_ sender: Any) {
    }
    
    @IBAction func closeButtonDidTouch(_ sender: Any) {
        dismiss(animated: true)
    }
}

