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
    @IBOutlet weak var randomColorButton: UIButton!
    
    private var isNew: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorTextField.addTarget(self, action: #selector(setColorFromTextField), for: .editingChanged)
    }
    
    // 여기에 label 정보를 받아오면 좋을 것같음 label: Label?
    func initEditView(isNew: Bool, label: String?) {
        self.isNew = isNew
        if isNew {
            setLabelColor(color: nil)
        }
        //guard let labelObject = label else { return }
        // label정보를 받아와서 세팅
    }
    
    @objc func setColorFromTextField() {
        if let color = UIColor(hex: colorTextField.text ?? "") {
            setLabelColor(color: color)
        }
    }
    
    private func setLabelColor(color: UIColor?) {
        var labelColor: UIColor
        
        if let color = color {
            labelColor = color
        } else {
            labelColor = UIColor.getRandomColor()
        }
        DispatchQueue.main.async { [weak self] in
            self?.labelPreviewLabel.backgroundColor = labelColor
            self?.randomColorButton.backgroundColor = labelColor
            self?.colorTextField.text = labelColor.toHexString()
        }
    }
    
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        if isNew {
            titleTextField.text = ""
            descriptionTextField.text = ""
        } else {
            // 처음 받았던 label 정보대로 초기화
        }
    }
    
    @IBAction func randomColorButtonDidTouch(_ sender: Any) {
        setLabelColor(color: nil)
    }
    
    @IBAction func saveButtonDidTouch(_ sender: Any) {
    }
    
    @IBAction func closeButtonDidTouch(_ sender: Any) {
        dismiss(animated: true)
    }
}
